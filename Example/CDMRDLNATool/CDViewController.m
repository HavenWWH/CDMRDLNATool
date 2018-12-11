//
//  CDViewController.m
//  CDMRDLNATool
//
//  Created by 513433750@qq.com on 12/10/2018.
//  Copyright (c) 2018 513433750@qq.com. All rights reserved.
//

#import "CDViewController.h"

#import "CDDLNATool.h"

@interface CDViewController ()

@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [[CDDLNATool sharedInstance] searchDevicesBlock:^(NSMutableArray *devicesArray) {
        
        NSLog(@"devices%@", devicesArray);
        if (devicesArray.count == 0) return;
        
        [[CDDLNATool sharedInstance] initDLNAWithDevice: devicesArray[0] playUrl: @""];
        [[CDDLNATool sharedInstance] startDLNA];
    }];
}
@end
