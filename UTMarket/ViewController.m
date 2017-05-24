//
//  ViewController.m
//  UTMarket
//
//  Created by Ashish sharma on 13/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()<GIDSignInDelegate,GIDSignInUIDelegate>
@property(strong, nonatomic) GIDSignInButton *signInButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HIDE_NAV_BAR
    
    [self setTextFieldBorder:txtEmail];
    [self setTextFieldBorder:txtPass];
    
    [self placholderTextColorChange:@"Enter email address..." :txtEmail];
    [self placholderTextColorChange:@"Enter password..." :txtPass];
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    [GIDSignIn sharedInstance].clientID = kClientID;
    
    _signInButton = [[GIDSignInButton alloc]init];
    _signInButton.center = self.view.center;
    [self.view addSubview:_signInButton];
    [GIDSignIn sharedInstance].delegate = self;
    
    _signInButton.hidden = YES;
    
    fbButton = [[FBSDKLoginButton alloc] init];
    [viewMain addSubview:fbButton];
    //fbButton.frame = btnFB.frame;
    fbButton.delegate = self;
    [fbButton setTitle:@"Facebook" forState:UIControlStateNormal];
    fbButton.readPermissions =
    @[@"public_profile", @"email",@"user_friends"];
    
    fbButton.loginBehavior = FBSDKLoginBehaviorWeb;
    
    //fbButton.frame = btnFB.frame;
    //fbButton.center = btnFB.center;
    
    fbButton.hidden = YES;
    
    
//    NSString *jsonString = @"{\"email\":\"sonu.singh868@gmail.com\",\"fbid\":\"100001696238628\",\"firstname\":\"Sonu\",\"lastname\":\"Singh\"}";
//
//    
//    
//    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
//    
//    AFHTTPRequestOperationManager *manager;
//
//    manager.requestSerializer = serializer;
//    
//    manager = [[AFHTTPRequestOperationManager alloc] init];
//    
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//    
//    NSDictionary *dic = @{@"email":@"sonu.singh868@gmail.com",
//                          @"fbid":@"100001696238628",
//                          @"firstname":@"Sonu",
//                          @"lastname": @"Singh"};
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.appone.biz/UTMarket/index.php?route=feed/rest_api/fb_login"]];
//     NSData *postData = [jsonString dataUsingEncoding:NSASCIIStringEncoding];
//    [request setHTTPBody:postData];
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    
//    
//   
//    
//    [manager HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
//     {
//        
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        
//    }];
//    
//    
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
/////    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
//    [manager.requestSerializer setValue:@"text/html" forHTTPHeaderField:@"Content-type"];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//
//    [manager POST:@"http://www.appone.biz/UTMarket/index.php?route=feed/rest_api/fb_login" parameters:jsonString success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
//    

}

- (IBAction)btnFBClk:(id)sender
{
    [fbButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)tapGID:(UIButton *)sender
{
    [_signInButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error
{
    //     Perform any operations on signed in user here.
    NSString *userId = user.userID;                  // For client-side use only!
    NSString *idToken = user.authentication.idToken; // Safe to send to the server
    NSString *fullName = user.profile.name;
    NSString *givenName = user.profile.givenName;
    NSString *familyName = user.profile.familyName;
    NSString *email = user.profile.email;
    
    [self performSegueWithIdentifier:@"goHome" sender:nil];
    
    NSLog(@"%@ %@ %@ %@ %@ %@",userId,idToken,fullName,givenName,familyName,email);
}

- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error
{
    
}

- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController
{
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Facebook Delegate

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error
{
    if (!error){
        
        NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
        [parameters setValue:@"id,name,email" forKey:@"fields"];
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
         {
             if(!error)
             {
                 NSLog(@"fetched user:%@", result);
                 [self performSegueWithIdentifier:@"goHome" sender:nil];

                 FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
                 [loginManager logOut];

             }
             
            
         }];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton;
{
    
}

// ******************************

-(void)setTextFieldBorder:(UITextField *)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, 2);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
}
//change the color and text value for place holder...

-(void)placholderTextColorChange:(NSString *)textValue :(UITextField *)textField
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:textValue attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    textField.attributedPlaceholder=str;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)tapLogin:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"goHome" sender:nil];

}


@end
