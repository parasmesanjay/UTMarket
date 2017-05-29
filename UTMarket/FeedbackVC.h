//
//  FeedbackVC.h
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 29/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackVC : UIViewController{
    
    IBOutlet UITextField *Emailtxt;
    IBOutlet UITextView *commetText;
    
    IBOutlet UIButton *btnSend;
    IBOutlet UITextField *nametxt;
}

@end
