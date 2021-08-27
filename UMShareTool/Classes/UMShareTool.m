//
//  UMShareTool.m
//  FBSnapshotTestCase
//
//  Created by mac on 2021/7/29.
//

#import "UMShareTool.h"
#import <UMCommon/UMCommon.h>

static NSString * UM_APPKEY = @"607549c974e00260863fc8f4";
// 微信
static NSString * WX_APPID = @"wxc726b716506bc973";
static NSString * WX_APPSECRET = @"523f66d2d8f73a58a45d6caee580b81c";
// QQ
static NSString * QQ_APPID = @"1111971580";
//新浪
static NSString * SINA_APPKEY = @"1171736492";
static NSString * SINA_APPSECRET = @"3dfb30b962a01a27eb9d3905f3202722";

@implementation UMShareTool
+(void)initWithAppkey:(NSString *)appKey channel:(NSString *)channel{
    [UMConfigure initWithAppkey:UM_APPKEY channel:@"app store"];
    [self configUShareSetting];
}

+(void)configUShareSetting{
    [UMSocialGlobal shareInstance].universalLinkDic = @{@(UMSocialPlatformType_WechatSession):@"https://pt.yltuteng.com/shared/",
        @(UMSocialPlatformType_QQ):@"https://pt.yltuteng.com/shared/"
                                                        };
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:WX_APPID appSecret:WX_APPSECRET redirectURL:nil];

//    /* 设置QQ */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:QQ_APPID/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];
//
//    /* 设置sina */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:SINA_APPKEY  appSecret:SINA_APPSECRET redirectURL:@"https://sns.whalecloud.com/sina2/callback"];
}



+ (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title decrption:(NSString *)desc thumImage:(UIImage *)image webUrl:(NSString *)webUrl completion:(void (^ )(id _Nullable data, NSError *error))completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:desc  thumImage:image];
    //设置网页地址
    shareObject.webpageUrl =webUrl;

    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;

    //调用分享接口
    [UMShareTool shareToPlatform:platformType object:messageObject completion:completion];
}

+ (void)shareImageToPlatformType:(UMSocialPlatformType)platformType imageUrl:(NSString *)imageUrl thumbImage:(UIImage *)icon completion:(void (^ )(id _Nullable data, NSError *error))completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = icon;
    [shareObject setShareImage:imageUrl];

    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;

    //调用分享接口
    [UMShareTool shareToPlatform:platformType object:messageObject completion:completion];
}

+ (void)shareTextToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content  completion:(void (^ )(id _Nullable data, NSError *error))completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = content;
    [UMShareTool shareToPlatform:platformType object:messageObject completion:completion];
    
}

+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content imageUrl:(NSString *)imageUrl thumbImage:(UIImage *)image completion:(void (^ )(id _Nullable data, NSError *error))completion
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];

    //设置文本
    messageObject.text = content;

    //创建图片内容对象
    UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
    //如果有缩略图，则设置缩略图
    shareObject.thumbImage = image;
    [shareObject setShareImage:imageUrl];

    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;

    //调用分享接口
    [UMShareTool shareToPlatform:platformType object:messageObject completion:completion];
}

+(void)shareToPlatform:(UMSocialPlatformType )platformType object:(UMSocialMessageObject*)object completion:(void (^ )(id _Nullable data, NSError *error))completion{
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:object currentViewController:nil completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
        }else{
            NSLog(@"response data is %@",data);
        }
        if (completion) {
            completion(data, error);
        }
    }];
}

+ (bool)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    return result;
}

+ (BOOL)application:(UIApplication *)app continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler{
    if (![[UMSocialManager defaultManager] handleUniversalLink:userActivity options:nil]) {
        // 其他SDK的回调
    }
    return YES;
}

@end
