//
//  FoalScoreAFAPIClient.m
//  foal score
//
//  Created by wi800 on 3/2/16.
//  Copyright © 2016 osu.edu. All rights reserved.
//

#import "FoalScoreAFAPIClient.h"

@implementation FoalScoreAFAPIClient

+(instancetype)sharedClient
{
    static FoalScoreAFAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Code to be run only once
        static NSString * const BaseURLString = @"http://foalscore.org.ohio-state.edu/foalscore/server/";
        NSURL *baseURL = [NSURL URLWithString:BaseURLString];
        _sharedClient = [[FoalScoreAFAPIClient alloc] initWithBaseURL:baseURL];
    });
    
    return _sharedClient;
}

-(void)registerNewUser:(NSMutableDictionary *)params withCompletitionBlock:(SuccessOrFailureCompletionBlock)block
{
    params[@"token"] = @"TODO";
    [self POST:@"users/add.json"
        parameters:params
        success:^(NSURLSessionDataTask *task, id responseObject) {
            block(responseObject, nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            block(nil, error);
        }];
}

-(void)loginUser:(NSMutableDictionary *)params withCompletitionBlock:(SuccessOrFailureCompletionBlock)block
{
    params[@"token"] = @"TODO";
    [self POST:@"users/login.json"
    parameters:params
       success:^(NSURLSessionDataTask *task, id responseObject) {
           block(responseObject, nil);
       } failure:^(NSURLSessionDataTask *task, NSError *error) {
           block(nil, error);
       }];
}

-(void)calculateSurvivalScore:(NSMutableDictionary *)params withCompletitionBlock:(SuccessOrFailureCompletionBlock)block
{
    params[@"token"] = @"TODO";
    [self POST:@"survivalscores/add.json"
    parameters:params
    success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",@"APIClient - success");
        block(responseObject, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",@"APIClient - error");
        block(nil, error);
        
    }];
}
@end