//
//  GallaryVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "GallaryVC.h"

@interface GallaryVC ()

@end

@implementation GallaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTintColor:imgLine1];
    [self setTintColor:imgLine1];
    
    btnPhoto.layer.cornerRadius = btnVideo.layer.cornerRadius = btnUploadFile.layer.cornerRadius = 5;
    btnPhoto.layer.masksToBounds = btnVideo.layer.masksToBounds = btnUploadFile.layer.masksToBounds = YES;
}

-(void) setTintColor:(UIImageView *)imgView
{
    [imgView setTintColor:APP_COLOR_Green];
    
    imgView.image =  [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}


- (IBAction)btnUploadFileClk:(id)sender
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UploadTypeVC *obj = [storybord instantiateViewControllerWithIdentifier:@"UploadTypeVC"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
