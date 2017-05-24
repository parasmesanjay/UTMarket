//
//  AppDelegate.h
//  UTMarket
//
//  Created by Ashish sharma on 13/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GTMOAuth2Authentication;

#import <GoogleSignIn/GoogleSignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

+(AppDelegate *)AppDelegate;
@property(nonatomic, readwrite) BOOL isFull;

@end

