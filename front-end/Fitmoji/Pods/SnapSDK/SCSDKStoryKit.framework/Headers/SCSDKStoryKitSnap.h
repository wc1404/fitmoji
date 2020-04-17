/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SCSDKStoryKitSnap.adtValue
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SCSDKStoryKitSnapInfo.h"
#import "SCSDKStoryKitSnapVideoInfo.h"
#import "SCSDKStoryKitSnapImageInfo.h"

typedef void (^SCSDKStoryKitSnapVideoMatchHandler)(SCSDKStoryKitSnapInfo *snapInfo, SCSDKStoryKitSnapVideoInfo *videoInfo);
typedef void (^SCSDKStoryKitSnapImageMatchHandler)(SCSDKStoryKitSnapInfo *snapInfo, SCSDKStoryKitSnapImageInfo *imageInfo);

@interface SCSDKStoryKitSnap : NSObject <NSCopying, NSCoding>

+ (instancetype)imageWithSnapInfo:(SCSDKStoryKitSnapInfo *)snapInfo imageInfo:(SCSDKStoryKitSnapImageInfo *)imageInfo
NS_SWIFT_NAME(image(snapInfo:imageInfo:));

+ (instancetype)new NS_UNAVAILABLE;

+ (instancetype)videoWithSnapInfo:(SCSDKStoryKitSnapInfo *)snapInfo videoInfo:(SCSDKStoryKitSnapVideoInfo *)videoInfo
NS_SWIFT_NAME(video(snapInfo:videoInfo:));

- (instancetype)init NS_UNAVAILABLE;

- (void)matchVideo:(SCSDKStoryKitSnapVideoMatchHandler)videoMatchHandler image:(SCSDKStoryKitSnapImageMatchHandler)imageMatchHandler;

@end

