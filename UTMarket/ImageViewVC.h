//
//  ImageViewVC.h
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewVC : UIViewController
{
    
    IBOutlet UIScrollView *scrlView;
    IBOutlet UIImageView *ImgView;
    
}

@property (nonatomic, strong) NSString *Url;

@end
