//
//  SCSDKStoryKitStoryPlayerErrorDelegate.h
//  SCSDKStoryKit
//
//  Created by Ethan Myers on 2/27/19.
//  Copyright © 2019 Snapchat. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCSDKStoryKitStoryPlayer;
@class SCSDKStoryKitSnap;


@protocol SCSDKStoryKitStoryPlayerErrorDelegate <NSObject>

- (void)player:(nonnull SCSDKStoryKitStoryPlayer *)player
          snap:(nonnull SCSDKStoryKitSnap *)snap
     indexPath:(nullable NSIndexPath *)indexPath
encounteredError:(nonnull NSError *)error
NS_SWIFT_NAME(player(player:snap:indexPath:encounteredError:));

@end
