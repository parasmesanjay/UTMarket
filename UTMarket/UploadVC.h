//
//  UploadVC.h
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadVC : UIViewController<APPhotoPickerDelegate>
{
    
    IBOutlet UIImageView *imgThumb;
    
    IBOutlet UIButton *btnUpload;
}

@property (nonatomic, readwrite) BOOL IsPhoto;

@end
