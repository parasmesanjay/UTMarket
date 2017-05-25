//
//  GiveRatingVC.h
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarRatingControl.h"
@interface GiveRatingVC : UIViewController
{

    IBOutlet UITextView *textFeedback;
    IBOutlet StarRatingControl *rating;
    
    IBOutlet UIButton *btnSubmit;

}

@property (nonatomic,strong) NSDictionary *info;

@end
