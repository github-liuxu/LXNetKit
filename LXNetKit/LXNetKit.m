//
//  LXNetKit.m
//  LXNetKit
//
//  Created by leyikao on 15/8/29.
//  Copyright (c) 2015年 leyikao. All rights reserved.
//

#import "LXNetKit.h"



@implementation LXNetKit

+ (void)sendAsynchronousUrlString:(NSString*)urlString HTTPMethod:(NSString *)httpMethod param:(NSDictionary*)param complate:(ComplateBlock)complateBlock field:(FieldBlock)fieldBlock{
    NSMutableURLRequest *request;
    if ([httpMethod caseInsensitiveCompare:@"GET"] == NSOrderedSame) {
        NSString *getStr = urlString;
        getStr = [urlString stringByAppendingString:@"?"];
        NSString *tempstr = @"";
        for (NSString *str in param) {
            NSString *value = [param objectForKey:str];
            [tempstr stringByAppendingFormat:@"%@=%@&",str,value];
        }
        [tempstr substringToIndex:tempstr.length-1];
        getStr= [getStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:getStr];
        request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        request.HTTPMethod = httpMethod;

    }
    
    if ([httpMethod caseInsensitiveCompare:@"POST"] == NSOrderedSame) {
        NSURL *url = [NSURL URLWithString:urlString];
        request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
        request.HTTPMethod = httpMethod;
        if (param) {
            NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            NSString *poststr = [NSString stringWithFormat:@"jsonInfo=%@",json];
            NSData *da = [poststr dataUsingEncoding:NSUTF8StringEncoding];
            request.HTTPBody = da;
        }else{
            NSString *poststr = [NSString stringWithFormat:@"jsonInfo={}"];
            NSData *da = [poststr dataUsingEncoding:NSUTF8StringEncoding];
            request.HTTPBody = da;
        }
    }
    
    NSOperationQueue *op = [[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:op completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (connectionError==nil) {
            NSString *resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            complateBlock(response,resultString);
        }else{
            fieldBlock(response,connectionError);
        }
    }];
}

@end
