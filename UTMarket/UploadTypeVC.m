//
//  UploadTypeVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "UploadTypeVC.h"

@interface UploadTypeVC ()

@end

@implementation UploadTypeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    
    [self setTintColor:imgLine1];
    [self setTintColor:imgLine2];
    
    btnImage.layer.cornerRadius = btnVideo.layer.cornerRadius = 5;
    btnImage.layer.masksToBounds = btnVideo.layer.masksToBounds = YES;
}

-(void) setTintColor:(UIImageView *)imgView
{
    [imgView setTintColor:APP_COLOR_Green];
    
    imgView.image =  [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}


- (IBAction)btnUploadClk:(UIButton *)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UploadVC *obj = [storybord instantiateViewControllerWithIdentifier:@"UploadVC"];
    
    if (sender.tag == 1)
    {
        obj.IsPhoto = false;
    }
    else
    {
        obj.IsPhoto = true;
    }
    
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
