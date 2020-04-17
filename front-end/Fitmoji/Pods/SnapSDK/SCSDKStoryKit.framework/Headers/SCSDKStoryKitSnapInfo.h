/**
 * This file is generated using the remodel generation script.
 * The name of the input file is SCSDKStoryKitSnapInfo.value
 */

#import <Foundation/Foundation.h>

@interface SCSDKStoryKitSnapInfo : NSObject <NSCopying, NSCoding>

@property (nonatomic, readonly, copy) NSString *snapId;
@property (nonatomic, readonly, copy) NSURL *url;
@property (nonatomic, readonly, copy) NSString *encryptionKey;
@property (nonatomic, readonly, copy) NSString *encryptionIv;
@property (nonatomic, readonly, copy) NSString *ownerExternalId;

- (instancetype)initWithSnapId:(NSString *)snapId url:(NSURL *)url encryptionKey:(NSString *)encryptionKey encryptionIv:(NSString *)encryptionIv ownerExternalId:(NSString *)ownerExternalId;

@end

