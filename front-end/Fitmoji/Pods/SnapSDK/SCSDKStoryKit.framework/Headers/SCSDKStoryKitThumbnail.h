/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SCSDKStoryKitThumbnail.value
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SCSDKStoryKitThumbnail : NSObject <NSCopying, NSCoding>

@property (nonatomic, readonly, copy) UIImage *image;
@property (nonatomic, readonly, copy) UIImage *placeholderImage;
@property (nonatomic, readonly, copy) NSURL *url;

- (instancetype)initWithImage:(UIImage *)image placeholderImage:(UIImage *)placeholderImage url:(NSURL *)url;

@end

