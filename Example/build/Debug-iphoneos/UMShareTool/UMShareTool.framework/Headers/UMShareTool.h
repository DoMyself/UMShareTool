//
//  UMShareTool.h
//  FBSnapshotTestCase
//
//  Created by mac on 2021/7/29.
//

#import <Foundation/Foundation.h>
#import <UMShare/UMShare.h>

//方法1、找到buildSetting---Allow Non-modular Includes In Framework Modules 这个值  改为YES.
//方法2、选中xxx.Framework下 Headers文件夹 右键 “add file to 'Headers' ”
//将这个 xxx.h 放到 .m文件中加载 就解决了这个问题。

NS_ASSUME_NONNULL_BEGIN

@interface UMShareTool : NSObject

/** 初始化友盟所有组件产品
 @param appKey 开发者在友盟官网申请的appkey.
 @param channel 渠道标识，可设置nil表示"App Store".
 */
+(void)initWithAppkey:(NSString*)appKey channel:(NSString*)channel;


/// 初始化第三方平台分享配置
+(void)configUShareSetting;


///分享网页链接
+ (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType title:(NSString *)title decrption:(NSString *)desc thumImage:(UIImage *)image webUrl:(NSString *)webUrl completion:(void (^ )(id _Nullable data, NSError *error))completion;

///网络图片分享
+ (void)shareImageToPlatformType:(UMSocialPlatformType)platformType imageUrl:(NSString *)imageUrl thumbImage:(UIImage *)icon completion:(void (^ )(id _Nullable data, NSError *error))completion;

///文字分享
+ (void)shareTextToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content  completion:(void (^ )(id _Nullable data, NSError *error))completion;

///图文分享
+ (void)shareImageAndTextToPlatformType:(UMSocialPlatformType)platformType content:(NSString *)content imageUrl:(NSString *)imageUrl thumbImage:(UIImage *)image completion:(void (^ )(id _Nullable data, NSError *error))completion;

+ (bool)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;

+ (BOOL)application:(UIApplication *)app continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler;
@end

NS_ASSUME_NONNULL_END
