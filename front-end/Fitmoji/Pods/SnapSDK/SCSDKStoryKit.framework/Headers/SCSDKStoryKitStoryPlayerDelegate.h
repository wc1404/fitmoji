//
//  SCSDKStoryKitStoryPlayerDelegate.h
//  SCSDKStoryKit
//
//  Created by Ethan Myers on 2/26/19.
//  Copyright © 2019 Snapchat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCSDKStoryKitStoryPlayer;
@class SCSDKStoryKitSnap;

@protocol SCSDKStoryKitStoryPlayerDelegate <NSObject>

@optional

/**
 Callback when a page starts to display.

 @param player: The player controlling the viewer.
 @param snap: The snap being displayed
 @param indexPath: An index into the viewer's viewingHistory array; note that if a data source ever returns a previous
 page or a previous group, the index path of a particular page may change.
 */
- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
didStartDisplayingSnap:(nonnull SCSDKStoryKitSnap *)snap
   atIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(player(player:didStartDisplayingSnap:atIndexPath:));

/**
 Callback when a page ends displaying.

 @param player: The player controlling the viewer.
 @param snap: The snap being displayed
 @param indexPath: An index into the viewer's viewingHistory array; note that if a data source ever returns a previous
 page or a previous group, the index path of a particular page may change.
 */
- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
didEndDisplayingSnap:(nonnull SCSDKStoryKitSnap *)snap
   atIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(player(player:didEndDisplayingSnap:atIndexPath:));

/**
 Callback when a the user transitions to the next snap on manual input (i.e. tapping on the right side of the player).

 @param player: The player controlling the viewer.
 @param snap: The snap being displayed
 @param indexPath: An index into the viewer's viewingHistory array; note that if a data source ever returns a previous
 page or a previous group, the index path of a particular page may change.
 */
- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
didTransitionToNextSnapOnUserInput:(nonnull SCSDKStoryKitSnap *)snap
   atIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(player(player:didTransitionToNextSnapOnUserInput:atIndexPath:));

/**
 Callback when a the user transitions to the previous snap on manual input (i.e. tapping on the left side of the player).

 @param player: The player controlling the viewer.
 @param snap: The snap being displayed
 @param indexPath: An index into the viewer's viewingHistory array; note that if a data source ever returns a previous
 page or a previous group, the index path of a particular page may change.
 */
- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
didTransitionToPreviousSnapOnUserInput:(nonnull SCSDKStoryKitSnap *)snap
   atIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(player(player:didTransitionToPreviousSnapOnUserInput:atIndexPath:));

/**
 Callback when the player transitions to the next snap automatically.  This can happen when a video is not set to loop or an image has a display timer.

 @param player: The player controlling the viewer.
 @param snap: The snap being displayed
 @param indexPath: An index into the viewer's viewingHistory array; note that if a data source ever returns a previous
 page or a previous group, the index path of a particular page may change.
 */
- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
didTransitionToNextSnapOnAutoProgression:(nonnull SCSDKStoryKitSnap *)snap
atIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(player(player:didTransitionToNextSnapOnAutoProgression:atIndexPath:));


@end
