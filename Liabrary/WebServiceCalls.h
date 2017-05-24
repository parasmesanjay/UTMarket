
#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, WebServiceResult)
{
    WebServiceResultSuccess = 0,
    WebServiceResultFail,
    WebServiceResultError
};

typedef NS_ENUM (NSInteger, NMVisibility)
{
    NMVisibilityAll = 0,
    NMVisibilityFriend,
    NMVisibilityNone,
};

typedef void(^WebCallBlock)(id JSON,WebServiceResult result);

@interface WebServiceCalls : NSObject

+ (void)POST:(NSString *)url parameter:(id )parameter completionBlock:(WebCallBlock)block;
+ (void)GET:(NSString *)url parameter:(NSDictionary *)parameter completionBlock:(WebCallBlock)block;
+ (void)POST:(NSString *)url parameter:(NSDictionary *)parameter imageData:(NSData *)imageData completionBlock:(WebCallBlock)block;

+ (void)alert:(NSString *)alertString;
+ (void)warningAlert:(NSString *)alertString;
+ (BOOL)isNetwork;

@end
