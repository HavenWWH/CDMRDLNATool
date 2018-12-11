//
//  CDDLNATool.h
//  CDProgramme
//
//  Created by 吴文海 on 2018/9/13.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLUPnPDevice.h"



typedef NS_ENUM(NSInteger, CDCastScreenStatus) {
    
    CDCastScreenStatusNoPlay       = 0, // 未投屏
    CDCastScreenStatusPlaying      = 1, // 投屏中
};
typedef void(^SearchDevicesBlock)(NSMutableArray *devicesArray);
typedef void(^EndDLNABlock)(void);
typedef void(^CompleteBlock)(void);

@interface CDDLNATool : NSObject
@property (nonatomic, assign) CDCastScreenStatus castScreenStatus;
// 当前投屏设备
@property (nonatomic, strong)  CLUPnPDevice *deviceModel;
// 当前投屏路径
@property (nonatomic, strong) NSString *playUrl;

/**
 *  初始化
 */
+ (instancetype)sharedInstance;

/**
 *  搜索设备, 返回设备列表
 */
- (void)searchDevicesBlock: (SearchDevicesBlock)searchBlock;

/**
 初始化投屏参数

 @param device 投屏的设备
 @param playUrl 投屏URL
 */
- (void)initDLNAWithDevice: (CLUPnPDevice *)device playUrl: (NSString *)playUrl;

/**
 *  开始投屏
 */
- (void)startDLNA;

/**
 结束投屏

 @param completeBlock 结束回调
 */
- (void)endTheCallback:(CompleteBlock)completeBlock;

/**
 *  结束投屏
 */
- (void)endDLNA;

/**
 *  投屏播放或者继续投屏
 */
- (void)dlnaPlay;

/**
 *  暂停投屏
 */
- (void)dlnaPause;

/**
 *  投屏seek
 */
- (void)seekChanged: (NSInteger)sec;

/**
 *  投屏下一首
 */
- (void)playNextwithURL:(NSString *)nextUrl;

@end
