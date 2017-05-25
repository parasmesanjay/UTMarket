//
//  ViewHeader.h
//  Town House
//
//  Created by Apple on 21/12/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewHeader : UIView

@property (strong,nonatomic)IBOutlet UIView *viewBack;
@property (strong,nonatomic)IBOutlet UILabel *lblTitle;
@property (nonatomic,strong)NSString *titleString;
@property (nonatomic,strong)UIViewController *selfBack;
@property (strong, nonatomic) IBOutlet UIView *ViewMenu;
@property (strong, nonatomic) IBOutlet UIButton *btnBack;

@property(nonatomic,readwrite) BOOL isBack;
@property(nonatomic,strong)UIView *drewerView;

@end
