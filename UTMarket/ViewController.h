//
//  ViewController.h
//  UTMarket
//
//  Created by Ashish sharma on 13/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController : UIViewController<FBSDKLoginButtonDelegate,GIDSignInUIDelegate>
{
    IBOutlet UIView *viewMain;
    
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPass;
    IBOutlet UIButton *btnFB;
    
    FBSDKLoginButton *fbButton;
}

@end

