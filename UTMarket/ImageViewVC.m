//
//  ImageViewVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ImageViewVC.h"

@interface ImageViewVC ()

@end

@implementation ImageViewVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Photo";

    
    NSString *str = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_Url];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:str];

    
    [ImgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question.png"]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
