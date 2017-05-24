//
//  DetailVC.m
//  UTMarket
//
//  Created by Ashish sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "DetailVC.h"
#import "DetailView.h"

@interface DetailVC ()
{
    UIScrollView *mainScroll;
}
@end

@implementation DetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Title";

    self.view.backgroundColor = WHITE_COLOR;
    
    if (_tag == 0)
    {
        [self showView:_info];
    }
    else
    {
        NSString *url = [NSString stringWithFormat:@"properties&id=%@",_info[@""]];
        
        [WebServiceCalls GET:url parameter:nil completionBlock:^(id JSON, WebServiceResult result) {
            
        }];
    }
}

-(void)showView:(id)data
{
    mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
    [self.view addSubview:mainScroll];
    
    DetailView *view = [[[NSBundle mainBundle]loadNibNamed:@"DetailView" owner:self options:nil] objectAtIndex:0];
    [mainScroll addSubview:view];
    view.frame = CGRectMake(0,0, WIDTH, view.frame.size.height);
    
    if (self.tag == 0)
    {
        view.imgProfile.hidden = YES;
        view.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];
        view.lblProfileName.text = view.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"owner_name"]];
        view.lblMobile.text = [NSString stringWithFormat:@"%@",_info[@"price"]];
        view.textDetail.text = [NSString stringWithFormat:@"%@",_info[@"description"]];
        view.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];
        view.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];

        
       NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_info[@"image"]];

        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [view.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        [view.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        [view.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];

        UIImageView *image = [[UIImageView alloc]initWithFrame:view.scrollSlieder.frame];
        [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        [view.scrollSlieder addSubview:image];
        
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
        
        
        NSArray *arr = @[@"MODERATE CANCELLATION POLICY",_info[@"price"],@"AVAILABILITY CALENDER",@"CONTACT HOST"];
        
        for (int i = 0; i<arr.count; i++)
        {
            UIView *viewLabel = [self viewLabel:arr[i]];
            viewLabel.frame = CGRectMake(10, view.frame.size.height+48*i, WIDTH-20, 40);
            [view addSubview:viewLabel];
        }
        
        view.frame = CGRectMake(0,0, WIDTH, view.frame.size.height+48*4+10);
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
    }

    // https://github.com/parasmesanjay/UTMarket.git
}


-(UIView *)viewLabel:(NSString *)title
{
    UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"DetailView" owner:self options:nil] objectAtIndex:1];
    
    UILabel *lbl = [view viewWithTag:1];
    lbl.text = title;
    
    return view;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
