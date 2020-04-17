//
//  SCSDKStoryKitStoryPlayer.h
//  SCSDKStoryKit
//
//  Created by Ethan Myers on 9/7/18.
//  Copyright © 2018 Snapchat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKIt.h>

@class SCSDKStoryKitAppStory;
@class SCSDKStoryKitSnap;
@class SCUserSession;
@class SCSDKStoryKitThumbnail;
@class SCSDKStoryKitStoryPlayer;
@class SCPlaybackCoreViewer;
@protocol SCPlaybackCorePage;

/**
 A loading view protocol, allowing customization of the view while a snap is loading.
 */
@protocol SCSDKStoryKitLoadingView <NSCopying>
- (void)startAnimating;
- (void)stopAnimating;
- (void)reset;
- (CGSize)contentSize;
@end

/**
 A player that contains the media playback components for watching a story.
 */
@interface SCSDKStoryKitStoryPlayer : NSObject

/**
 The view that contains the story playback
 */
@property (atomic, readonly, strong) UIViewController *viewer;

/**
 Progamatically moves the player to the next snap.
 */
- (void)goToNextSnap;

/**
 Progamatically moves the player to the previous snap.
 */
- (void)goToPreviousSnap;

/**
 Index of the current snap showing.
 */
- (NSIndexPath *)currentSnapIndexPath;

/**
 The state of sound for the player.
 */
@property (nonatomic, assign, getter=isMuted) BOOL muted;

@end
