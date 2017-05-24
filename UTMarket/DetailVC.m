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
        NSString *urlString = @"";
        
        if (_tag == 65)
        {
            urlString = @"carSellerAndDealers";
            urlString = [NSString stringWithFormat:@"carSellerAndDealers&id=%@",_info[@"car_seller_dealer_id"]];

        }
        else if (_tag == 66)
        {
            urlString = @"carRenters";
            urlString = [NSString stringWithFormat:@"carRenters&id=%@",_info[@"car_renters_id"]];

        }
        else if (_tag == 67)
        {
            urlString = @"carPartSellers";
            urlString = [NSString stringWithFormat:@"carPartSellers&id=%@",_info[@"car_part_seller_id"]];

        }
        else if (_tag == 68)
        {
            urlString = @"CarMechanicLocations";
            urlString = [NSString stringWithFormat:@"CarMechanicLocations&id=%@",_info[@"car_mechanic_location_id"]];

        }
        else if (_tag == 71)
        {
            urlString = [NSString stringWithFormat:@"gameReserver&id=%@",_info[@"game_reserver_id"]];
        }
        else if (_tag == 72)
        {
            urlString = [NSString stringWithFormat:@"site&id=%@",_info[@"site_id"]];
        }
        else if (_tag == 70)
        {
            urlString = [NSString stringWithFormat:@"tourism&id=%@",_info[@"tourism_id"]];
        }

        SVHUD_START
        [WebServiceCalls GET:urlString parameter:nil completionBlock:^(id JSON, WebServiceResult result) {
           
            SVHUD_STOP
            NSLog(@"%@",JSON);
            NSLog(@"%@",JSON);
            
            [self showView:JSON[@"data"]];


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
    else if (_tag == 68)
    {
        view.imgProfile.hidden = YES;
        view.lblName.text = [NSString stringWithFormat:@"%@",data[@"mechanic_name"]];
        view.lblProfileName.text = view.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"mechanic_name"]];
        view.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"mechanic_email"]];
        view.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"mechanic_telephone"]];
        
        view.textDetail.text = [NSString stringWithFormat:@"%@",data[@"mechanic_location"]];
        
        
//        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_info[@"image"]];
//        
//        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
//        [view.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        [view.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        [view.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        
//        UIImageView *image = [[UIImageView alloc]initWithFrame:view.scrollSlieder.frame];
//        [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        [view.scrollSlieder addSubview:image];
        
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
        
    }
    else if (_tag == 67)
    {
        view.lblName.text = [NSString stringWithFormat:@"%@",data[@"seller_image"]];
        view.lblProfileName.text = view.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"seller_image"]];
        view.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
        view.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"price"]];
        
        view.textDetail.text = [NSString stringWithFormat:@"%@",data[@"description"]];
        
        
        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"seller_image"]];
        
////        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
////        [view.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
////        [view.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
////        [view.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        
//        UIImageView *image = [[UIImageView alloc]initWithFrame:view.scrollSlieder.frame];
//        [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
//        [view.scrollSlieder addSubview:image];
        
        
        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];

        [view.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];

        
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
        
        NSArray *arr = @[data[@"seller_email"],[NSString stringWithFormat:@"%@",data[@"seller_telephone"]]];
        
        for (int i = 0; i<arr.count; i++)
        {
            UIView *viewLabel = [self viewLabel:arr[i]];
            viewLabel.frame = CGRectMake(10, view.frame.size.height+48*i, WIDTH-20, 40);
            [view addSubview:viewLabel];
        }
        
        view.frame = CGRectMake(0,0, WIDTH, view.frame.size.height+48*2+10);
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);

    }
    else if (_tag == 65)
    {
        view.lblName.text = [NSString stringWithFormat:@"%@",data[@"car_renter_name"]];
        view.lblProfileName.text = view.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"car_renter_name"]];
        view.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
        view.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"car_rent_price"]];
        
        view.textDetail.text = [NSString stringWithFormat:@"%@",data[@"car_description"]];
        
        //        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_info[@"image"]];
        //
        //        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        //        [view.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //
        //        UIImageView *image = [[UIImageView alloc]initWithFrame:view.scrollSlieder.frame];
        //        [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.scrollSlieder addSubview:image];
        
        
        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"car_renter_image"]];
        
        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        [view.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
        
        NSArray *arr = @[data[@"car_renter_email"],[NSString stringWithFormat:@"%@",data[@"car_renter_telephone"]]];
        
        for (int i = 0; i<arr.count; i++)
        {
            UIView *viewLabel = [self viewLabel:arr[i]];
            viewLabel.frame = CGRectMake(10, view.frame.size.height+48*i, WIDTH-20, 40);
            [view addSubview:viewLabel];
        }
        
        view.frame = CGRectMake(0,0, WIDTH, view.frame.size.height+48*2+10);
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);

    }
    
    if (_tag == 65)
    {
        view.lblName.text = [NSString stringWithFormat:@"%@",data[@"seller_name"]];
        view.lblProfileName.text = view.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"seller_name"]];
        view.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
        view.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"car_price"]];
        
        view.textDetail.text = [NSString stringWithFormat:@"%@",data[@"car_description"]];
        
        //        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_info[@"image"]];
        //
        //        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        //        [view.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //
        //        UIImageView *image = [[UIImageView alloc]initWithFrame:view.scrollSlieder.frame];
        //        [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        //        [view.scrollSlieder addSubview:image];
        
        
        NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"car_renter_image"]];
        
        NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        [view.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
        
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);
        
        NSArray *arr = @[data[@"seller_email"],[NSString stringWithFormat:@"%@",data[@"seller_telephone"]]];
        
        for (int i = 0; i<arr.count; i++)
        {
            UIView *viewLabel = [self viewLabel:arr[i]];
            viewLabel.frame = CGRectMake(10, view.frame.size.height+48*i, WIDTH-20, 40);
            [view addSubview:viewLabel];
        }
        
        view.frame = CGRectMake(0,0, WIDTH, view.frame.size.height+48*2+10);
        mainScroll.contentSize = CGSizeMake(WIDTH,view.frame.size.height);

    }

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
