//
//  LXNetKit.h
//  LXNetKit
//
//  Created by leyikao on 15/8/29.
//  Copyright (c) 2015年 leyikao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ComplateBlock)(NSURLResponse *response,NSString *result);
typedef void(^FieldBlock)(NSURLResponse *response,NSError *connectionError);

@interface LXNetKit : NSObject

+ (void)sendAsynchronousSessionUrl:(NSString *)urlString HTTPMethod:(NSString *)httpMethod param:(NSDictionary *)param complate:(ComplateBlock)complateBlock field:(FieldBlock)fieldBlock;
+ (void)sendAsynchronousUrlString:(NSString*)urlString HTTPMethod:(NSString *)httpMethod param:(NSDictionary*)param complate:(ComplateBlock)complateBlock field:(FieldBlock)fieldBlock;

@end
