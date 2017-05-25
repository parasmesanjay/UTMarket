//
//  MenuView.h
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;

@property(nonatomic,strong)UIViewController *selfBack;
@property(nonatomic,strong)UIView *drewerView;

@end
