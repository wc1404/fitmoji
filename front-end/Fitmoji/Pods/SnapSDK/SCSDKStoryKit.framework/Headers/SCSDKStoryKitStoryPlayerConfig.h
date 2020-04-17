/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SCSDKStoryKitStoryPlayerConfig.value
 */

#import <Foundation/Foundation.h>
#import "SCSDKStoryKitThumbnail.h"
#import <UIKit/UIKit.h>
#import "SCSDKStoryKitStoryPlayer.h"
#import "SCSDKStoryKitAppStory.h"

@interface SCSDKStoryKitStoryPlayerConfig : NSObject <NSCopying, NSCoding>

@property (nonatomic, readonly, copy) SCSDKStoryKitAppStory *appStory;
@property (nonatomic, readonly, copy) SCSDKStoryKitThumbnail *thumbnail;
@property (nonatomic, readonly, copy) UIView<SCSDKStoryKitLoadingView> *loadingView;
@property (nonatomic, readonly) BOOL shouldUseSnapThumbnail;
@property (nonatomic, readonly) BOOL shouldShowLeftTapOverlay;
@property (nonatomic, readonly) BOOL shouldAspectFillMedia;

- (instancetype)initWithAppStory:(SCSDKStoryKitAppStory *)appStory thumbnail:(SCSDKStoryKitThumbnail *)thumbnail loadingView:(UIView<SCSDKStoryKitLoadingView> *)loadingView shouldUseSnapThumbnail:(BOOL)shouldUseSnapThumbnail shouldShowLeftTapOverlay:(BOOL)shouldShowLeftTapOverlay shouldAspectFillMedia:(BOOL)shouldAspectFillMedia

NS_SWIFT_NAME(init(appStory:thumbnail:loadingView:shouldUseSnapThumbnail:shouldShowLeftTapOverlay:shouldAspectFillMedia:));

@end

