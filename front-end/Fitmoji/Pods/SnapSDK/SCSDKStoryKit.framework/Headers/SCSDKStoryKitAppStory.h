/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SCSDKStoryKitAppStory.value
 */

#import <Foundation/Foundation.h>
#import "SCSDKStoryKitSnap.h"

@interface SCSDKStoryKitAppStory : NSObject <NSCopying, NSCoding>

@property (nonatomic, readonly, copy) NSArray<SCSDKStoryKitSnap *> *snaps;

- (instancetype)initWithSnaps:(NSArray<SCSDKStoryKitSnap *> *)snaps;

@end

