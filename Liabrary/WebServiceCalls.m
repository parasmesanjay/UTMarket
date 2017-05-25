//
//  WebServiceCalls.m
//  Ponder_remake
//
//  Created by Yudiz Solutions on 04/07/13.
//  Copyright (c) 2013 Yudiz Solutions. All rights reserved.
//

#import "WebServiceCalls.h"
#import "AFNetworking.h"

static AFHTTPRequestOperationManager *manager;


@interface WebServiceCalls(){
}
@end

static NSString *getuserphone;

@implementation WebServiceCalls

+ (void)initialize
{
    
    manager = [[AFHTTPRequestOperationManager alloc] init];
    manager.securityPolicy.allowInvalidCertificates = YES;//This is for https
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
}

+ (void)POSTJSON:(NSString *)url parameter:(NSString *)parameter completionBlock:(WebCallBlock)block
{
    @try
    {
        if ([WebServiceCalls isNetwork]==YES)
        {
            
            NSData *postData = [parameter dataUsingEncoding:NSASCIIStringEncoding];
            NSURL *urlStr=  [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@",BASE_URL,url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:urlStr];
            
            [request setHTTPBody:postData];
            [request setHTTPMethod:@"POST"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            
            NSError *error = NULL;
            NSURLResponse *response = NULL;
            NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ];
            id responce = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            block(responce,WebServiceResultSuccess);
        }
    }
    @catch (NSException *exception)
    {
        block(@"1",WebServiceResultFail);
    }
}



+ (void)POST:(NSString *)url parameter:(id)parameter completionBlock:(WebCallBlock)block
{
    if ([self isNetwork])
    {
        @try
        {            
            NSString *URLSTRING = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
            [manager POST:[URLSTRING stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
             {
             }
                  success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 NSMutableArray * responseJson = [[NSMutableArray alloc]init];
                 responseJson = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                 block(responseJson,WebServiceResultSuccess);
                 
             }
             
                  failure:^(AFHTTPRequestOperation *operation, NSError* error)
             {
                 [SVProgressHUD dismiss];
                 block(@"1",WebServiceResultSuccess);
                 
             }];
            
        }
        @catch (NSException *exception)
        {
            block(@"1",WebServiceResultSuccess);
        }
    }
}

+ (void)POST:(NSString *)url parameter:(NSDictionary *)parameter imageData:(NSData *)imageData completionBlock:(WebCallBlock)block
{

    @try
    {
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
        manager.securityPolicy.allowInvalidCertificates = YES;//This is for https
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager POST:url parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
         {
             [formData appendPartWithFileData:imageData name:@"food_image" fileName:@"food_image.jpg" mimeType:@"image/jpeg"];
         }
              success:^(AFHTTPRequestOperation *operation, id responseObject)
         {
             
             NSMutableArray * responseJson = [[NSMutableArray alloc]init];
             responseJson = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             block(responseJson,WebServiceResultSuccess);
             
         }
         
              failure:^(AFHTTPRequestOperation *operation, NSError* error)
         {
             block(@"1",WebServiceResultSuccess);
             
         }];
        
    }
    @catch (NSException *exception)
    {
        block(@"1",WebServiceResultSuccess);
    }
    
}

+ (void)GET:(NSString *)url parameter:(NSDictionary *)parameter completionBlock:(WebCallBlock)block
{
    
    
    @try
    {
        
        
        NSString *URLSTRING = [NSString stringWithFormat:@"%@%@",BASE_URL,url];
        [manager GET:[URLSTRING stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
         {
            [SVProgressHUD dismiss];
            NSMutableArray * responseJson = [[NSMutableArray alloc]init];
            responseJson = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            block(responseJson,WebServiceResultSuccess);
            
        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            [SVProgressHUD dismiss];
            block(@"1",WebServiceResultSuccess);

        }];
        
    /*  NSURL *urlStr=  [NSURL URLWithString:[[NSString stringWithFormat:@"%@%@",BASE_URL,url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:urlStr];
        NSError *error = NULL;
        NSURLResponse *response = NULL;
        NSData *data  = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error ];
        NSDictionary *vehicel_dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        block(vehicel_dic,WebServiceResultSuccess);*/
        
    }
    @catch (NSException *exception)
    {
        block(@"1",WebServiceResultSuccess);
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"Network Error" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [aler show];
    }
    
}

+(void)warningAlert:(NSString *)alertString
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert !" message:alertString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
+(void)alert:(NSString *)alertString
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:alertString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}



+(BOOL)isNetwork
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable)
    {
        [SVProgressHUD dismiss];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Network Error" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    else
    {
        return YES;
    }
}

@end

