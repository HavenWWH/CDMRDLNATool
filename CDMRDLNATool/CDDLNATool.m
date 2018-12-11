//
//  CDDLNATool.m
//  CDProgramme
//
//  Created by 吴文海 on 2018/9/13.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "CDDLNATool.h"
#import "MRDLNA.h"

@interface CDDLNATool ()<DLNADelegate>

@property (nonatomic, strong) MRDLNA *dlnaManager;
@property (nonatomic, copy) SearchDevicesBlock searchBlock;
@property (nonatomic, copy) CompleteBlock completeBlock;
@end


@implementation CDDLNATool
#pragma mark - Intial Methods
+ (instancetype)sharedInstance {
    
    static CDDLNATool *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        instance = [CDDLNATool new];
    });
    
    return instance;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.dlnaManager = [MRDLNA sharedMRDLNAManager];
        self.dlnaManager.delegate = self;
    }
    return self;
}

#pragma mark - public method
// 搜索设备
- (void)searchDevicesBlock: (SearchDevicesBlock)searchBlock {
    
    _searchBlock = searchBlock;
    [self.dlnaManager startSearch];
}

// 设置投屏参数
- (void)initDLNAWithDevice: (CLUPnPDevice *)device playUrl: (NSString *)playUrl {
    
    self.dlnaManager.device = device;
    self.dlnaManager.playUrl = playUrl;
}

// 开始投屏
- (void)startDLNA {
    
    self.castScreenStatus = CDCastScreenStatusPlaying;
    [self.dlnaManager startDLNA];
}

// 结束投屏
- (void)endDLNA {
    
    self.castScreenStatus = CDCastScreenStatusNoPlay;
    [self.dlnaManager endDLNA];
}

- (void)endTheCallback:(CompleteBlock)completeBlock {
    
    _completeBlock = completeBlock;
}

// 投屏继续播放
- (void)dlnaPlay {
    
    self.castScreenStatus = CDCastScreenStatusPlaying;
    [self.dlnaManager dlnaPlay];
}

// 投屏暂停
- (void)dlnaPause {
    
    self.castScreenStatus = CDCastScreenStatusPlaying;
    [self.dlnaManager dlnaPause];
}

// seek 秒
- (void)seekChanged: (NSInteger)sec {
    
    self.castScreenStatus = CDCastScreenStatusPlaying;
    NSLog(@"播放进度条======>: %@",@(sec));
    [self.dlnaManager seekChanged:sec];
}

- (void)playNextwithURL:(NSString *)nextUrl {
    
    if (nextUrl.length > 0) {
        [self.dlnaManager playTheURL:nextUrl];
    }
}


#pragma mark - DLNADelegate

/**
 发现设备代理回调

 @param devicesArray 设备列表
 */
- (void)searchDLNAResult:(NSArray *)devicesArray{
    
    NSLog(@"发现设备");
    if (self.searchBlock) {
        self.searchBlock([devicesArray mutableCopy]);
    }
}


#pragma mark - setter  getter
- (CLUPnPDevice *)deviceModel {
    
    return self.dlnaManager.device;
}

- (NSString *)playUrl {
    
    return self.dlnaManager.playUrl;
}
@end
