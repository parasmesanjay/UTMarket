//
//  ProfileEditVC.h
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 26/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileEditVC : UIViewController<APPhotoPickerDelegate>{

    IBOutlet UIButton *btnProfile;
    IBOutlet UIButton *UpdateBtn;
  //  IBOutlet UILabel *testlbl;
    
    //IBOutlet UIButton *CancelBtn;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *UserImg;
@property (strong, nonatomic) IBOutlet UITextField *Firstnametxt;

@property (strong, nonatomic) IBOutlet UITextField *Lastnametxt;
@property (strong, nonatomic) IBOutlet UITextField *ContactTxt;


@end
