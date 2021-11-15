//
//  Course.h
//  API Call
//
//  Created by Htet Moe Phyu on 15/11/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSObject
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSNumber *numberOfLessons;
@end

NS_ASSUME_NONNULL_END
