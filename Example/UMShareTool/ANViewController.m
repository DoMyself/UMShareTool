//
//  ANViewController.m
//  UMShareTool
//
//  Created by 13235661527 on 07/29/2021.
//  Copyright (c) 2021 13235661527. All rights reserved.
//

#import "ANViewController.h"
#import <UMShareTool/UMShareTool.h>

@interface ANViewController ()

@end

@implementation ANViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [UMShareTool initWithAppkey:@"" channel:@""];
    CGFloat width = self.view.frame.size.width;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"微信" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 120, width, 50);
    [button addTarget:self action:@selector(weixinshare) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)weixinshare{
    [UMShareTool shareTextToPlatformType:UMSocialPlatformType_WechatSession content:@"微信文字分享" completion:^(id  _Nullable data, NSError * _Nonnull error) {
        
    }];
}
@end
