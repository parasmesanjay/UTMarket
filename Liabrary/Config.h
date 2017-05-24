//
//  Config.h
//  Vizzou'
//
//  Created by Ashish Kumar Sharma on 04/07/16.
//  Copyright © 2016 Ashish Kumar Sharma. All rights reserved.
//

#ifndef Config_h

#define WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define BASE_URL @"http://appone.biz/UTMarket/index.php?route=feed/rest_api/"
#define kClientID @"952299274319-2pr0ubuj01vninn64rrq475sjv6gdcd2.apps.googleusercontent.com";
#define BASE_URL_SOURCE @"http://www.townhouseapp.com"

#define SPUserID [[NSUserDefaults standardUserDefaults]objectForKey:@"SPUserNameID"]
#define User_name [[NSUserDefaults standardUserDefaults]objectForKey:@"name"]
#define User_idendtity [[NSUserDefaults standardUserDefaults]objectForKey:@"identity"]

#define User_UserName [[NSUserDefaults standardUserDefaults]objectForKey:@"username"]
#define is_Poster [[NSUserDefaults standardUserDefaults]boolForKey:@"worker"] == NO
#define is_Worker [[NSUserDefaults standardUserDefaults]boolForKey:@"worker"] == YES


////// --- COLORS

#define WHITE_COLOR [UIColor colorWithRed:1 green:1 blue:1 alpha:1]
#define BLACK_COLOR [UIColor colorWithRed:0 green:0 blue:0 alpha:1]
#define CLEAR_COLOR [UIColor clearColor]
#define GRAY_COLOR [UIColor grayColor]

#define STATUS_COLOR [UIColor colorWithRed:52.0/255.0 green:172.0/255.0 blue:232.0/255.0 alpha:1]
#define APP_COLOR_HEADER [UIColor colorWithRed:49/255.0 green:201/255.0 blue:255/255.0 alpha:1]
#define APP_COLOR_BLUE [UIColor colorWithRed:0/255.0 green:122/255.0 blue:232/255.0 alpha:1]
#define TABLE_HEADER_COLOR [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1]
#define APP_COLOR_Green [UIColor colorWithRed:83/255.0 green:163/255.0 blue:24/255.0 alpha:1]

#define APP_COLOR_SKYCOLOR [UIColor colorWithRed:49/255.0 green:201/255.0 blue:232/255.0 alpha:1]


////// --- FIX CODES

#define HIDE_KEY [self.view endEditing:YES];

#define MBHUD_START [MBProgressHUD showHUDAddedTo:self.view animated:YES];
#define MBHUD_STOP  [MBProgressHUD hideHUDForView:self.view animated:YES];

#define SVHUD_START [SVProgressHUD show];
#define SVHUD_STOP  [SVProgressHUD dismiss];

#define DataArray [AppDelegate AppDelegate].dataTasks

#define HIDE_KEY_ON_TOUCH -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event { HIDE_KEY }

#define HIDE_NAV_BAR self.navigationController.navigationBarHidden = YES;

#define POP_BACK [self.navigationController popViewControllerAnimated:YES];

#define STATUS_BAR_WHITE UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = WHITE_COLOR; [self.view addSubview:status];

#define STATUS_BAR UIView *status = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 20)]; status.backgroundColor = STATUS_COLOR; [self.view addSubview:status];

#define GET_HEADER_VIEW  ViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"ViewHeader" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64); header.viewBack.hidden = YES;

#define GET_HEADER_VIEW_WITH_BACK ViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"ViewHeader" owner:self options:nil] objectAtIndex:0]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64);

#define GET_TIP_VIEW TipView *tipView = [[[NSBundle mainBundle] loadNibNamed:@"ViewOther" owner:self options:nil] objectAtIndex:0]; tipView.selfBack = self;[self.view addSubview:tipView]; tipView.frame = CGRectMake(0,HEIGHT-60, WIDTH, 60);

#define GET_HEADER_VIEW_CART HeaderViewCart *header = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:2]; header.selfBack = self;[self.view addSubview:header]; header.frame = CGRectMake(0, 0, WIDTH, 64);

#define SET_CORNER layer.cornerRadius = 5;

#define Config_h

#endif
