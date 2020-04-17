//
//  SCSDKStoryKitSession.h
//  SCSDKStoryKit
//
//  Created by Ethan Myers on 10/4/18.
//  Copyright © 2018 Snapchat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SCSDKStoryKitStoryPlayer;
@class SCSDKStoryKitAppStory;
@class SCSDKStoryKitThumbnail;
@class SCSDKStoryKitSnap;
@class SCSDKStoryKitStoryPlayerConfig;
@protocol SCSDKStoryKitLoadingView;
@protocol SCSDKStoryKitStoryPlayerDelegate;
@protocol SCSDKStoryKitStoryPlayerErrorDelegate;

/**
 A session for creating players and maintaining the cache.
 */

@interface SCSDKStoryKitSession : NSObject

/**
 Creates a story player to be maintained by the caller.
 */
- (SCSDKStoryKitStoryPlayer *)createStoryPlayerWithConfiguration:(SCSDKStoryKitStoryPlayerConfig *)configuration
                                                        delegate:(id<SCSDKStoryKitStoryPlayerDelegate>)delegate
                                                   errorDelegate:(id<SCSDKStoryKitStoryPlayerErrorDelegate>)errorDelgate NS_RETURNS_RETAINED
NS_SWIFT_NAME(createStoryPlayer(configuration:delegate:errorDelegate:));

/**
 Prefetches snap to be stored in the cache.
 */
- (void)beginPrefetchingSnap:(SCSDKStoryKitSnap *)snap;

/**
 Cancels prefetching of snap if one is in progress.
 */
- (void)cancelPrefetchingSnap:(SCSDKStoryKitSnap *)snap;

/**
 Cancel all prefetches that are in progress.
 */
- (void)cancelAllPrefetches;

/**
 Post back call to inform the story kit session the user has logged out to allow for cleanup.
 */
- (void)userHasLoggedOut;

@end
