//
//  DetailVC.m
//  UTMarket
//
//  Created by Ashish sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "DetailVC.h"
#import "DetailView.h"
#import "GiveRatingVC.h"

@interface DetailVC ()
{
    UIScrollView *mainScroll;
    UIScrollView *slider;
    NSTimer *timer;
    
    DetailView *viewDetail;
    
    NSDictionary *dic;
}
@end

@implementation DetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Item Details";
    
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
            
            @try {
                SVHUD_STOP
//                NSLog(@"%@",JSON);
//                NSLog(@"%@",JSON);
                
                dic = JSON[@"data"];
                [self showView:JSON[@"data"]];
                
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
        }];
    }
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [timer invalidate];
    
    if (self.isMovingFromParentViewController || self.isBeingDismissed) {
        
    }
}
-(void)showView:(id)data
{
    
    @try {
        
        
        mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64)];
        [self.view addSubview:mainScroll];
        
        viewDetail = [[[NSBundle mainBundle]loadNibNamed:@"DetailView" owner:self options:nil] objectAtIndex:0];
        [mainScroll addSubview:viewDetail];
        viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height);
        
        if (self.tag == 0)
        {
            viewDetail.imgProfile.hidden = YES;
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"owner_name"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",_info[@"price"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",_info[@"description"]];
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",_info[@"property_name"]];
            
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",_info[@"image"]];
            
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            UIImageView *image = [[UIImageView alloc]initWithFrame:viewDetail.scrollSlieder.frame];
            [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            [viewDetail.scrollSlieder addSubview:image];
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            
            
            NSArray *arr = @[@"MODERATE CANCELLATION POLICY",_info[@"price"],@"AVAILABILITY CALENDER",@"CONTACT HOST"];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*4+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
        }
        else if (_tag == 68)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"mechanic_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"mechanic_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"mechanic_email"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"mechanic_telephone"]];
            
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"mechanic_location"]];
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"mechanic_image"]];
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            [viewDetail.imgProfile sd_setImageWithURL:url];
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
        }
        else if (_tag == 67)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"seller_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"seller_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"price"]];
            
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"description"]];
            
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"seller_image"]];
            
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            
            NSArray *arr = @[data[@"seller_email"],[NSString stringWithFormat:@"%@",data[@"seller_telephone"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*2+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            
        }
        else if (_tag == 66)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"car_renter_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"car_renter_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"car_rent_price"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"car_description"]];
            viewDetail.scrollSlieder.userInteractionEnabled = NO;
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"car_renter_image"]];
            
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            
            NSArray *arr = @[data[@"car_renter_email"],[NSString stringWithFormat:@"%@",data[@"car_renter_telephone"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*2+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            
        }
        
        if (_tag == 65)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"seller_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"seller_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"car_model"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"car_price"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"car_description"]];
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"car_renter_image"]];
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            NSArray *arr = @[data[@"seller_email"],[NSString stringWithFormat:@"%@",data[@"seller_telephone"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*2+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);

        }
        else if (_tag == 71)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"place_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"place_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"agent_name"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"agent_telephone"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"description"]];
            
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"image"]];
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            NSArray *arr = @[data[@"agent_email"],
                             [NSString stringWithFormat:@"%@",data[@"term_conditions"]],
                             [NSString stringWithFormat:@"%@",data[@"additional_info"]],
                             [NSString stringWithFormat:@"%@",data[@"country_id"]],
                             [NSString stringWithFormat:@"%@",data[@"state_id"]],
                             [NSString stringWithFormat:@"%@",data[@"city_id"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*arr.count+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            

        }
        else if (_tag == 72)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"place_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"place_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"agent_name"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"agent_telephone"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"description"]];
            
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"image"]];
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            NSArray *arr = @[data[@"agent_email"],
                             [NSString stringWithFormat:@"%@",data[@"term_conditions"]],
                             [NSString stringWithFormat:@"%@",data[@"additional_info"]],
                             [NSString stringWithFormat:@"%@",data[@"country_id"]],
                             [NSString stringWithFormat:@"%@",data[@"state_id"]],
                             [NSString stringWithFormat:@"%@",data[@"city_id"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*arr.count+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            

        }
        else if (_tag == 70)
        {
            viewDetail.lblName.text = [NSString stringWithFormat:@"%@",data[@"place_name"]];
            viewDetail.lblProfileName.text = viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",_info[@"place_name"]];
            viewDetail.lblDetail.text = [NSString stringWithFormat:@"%@",data[@"agent_name"]];
            viewDetail.lblMobile.text = [NSString stringWithFormat:@"%@",data[@"agent_telephone"]];
            viewDetail.textDetail.text = [NSString stringWithFormat:@"%@",data[@"description"]];
            
            
            NSString *urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",data[@"image"]];
            NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [viewDetail.imgProfile sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            
            
            for (int i=0;i<[data[@"images"] count]; i++)
            {
                urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"popup"]];
                url = [NSURL URLWithString:urlSrting];
                
                UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH*i,0, WIDTH, viewDetail.scrollSlieder.frame.size.height)];
                [image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                [viewDetail.scrollSlieder addSubview:image];
                
                if (i == 0)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    
                    if([data[@"images"] count] == 1)
                    {
                        [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    if([data[@"images"] count] ==2)
                    {
                        [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                    }
                    
                }
                
                if (i == 1)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_1 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
                if (i == 2)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",data[@"images"][i][@"thumb"]];
                    url = [NSURL URLWithString:urlSrting];
                    [viewDetail.img_icon_2 sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
                }
            }
            
            viewDetail.scrollSlieder.contentSize = CGSizeMake(WIDTH*[data[@"images"] count], slider.frame.size.height);
            timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sliderRunning) userInfo:nil repeats:YES];
            
            
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);
            NSArray *arr = @[data[@"agent_email"],
                             [NSString stringWithFormat:@"%@",data[@"term_conditions"]],
                             [NSString stringWithFormat:@"%@",data[@"additional_info"]],
                             [NSString stringWithFormat:@"%@",data[@"country_id"]],
                             [NSString stringWithFormat:@"%@",data[@"state_id"]],
                             [NSString stringWithFormat:@"%@",data[@"city_id"]]];
            
            for (int i = 0; i<arr.count; i++)
            {
                UIView *viewLabel = [self viewLabel:arr[i]];
                viewLabel.frame = CGRectMake(10, viewDetail.frame.size.height+48*i, WIDTH-20, 40);
                [viewDetail addSubview:viewLabel];
            }
            
            viewDetail.frame = CGRectMake(0,0, WIDTH, viewDetail.frame.size.height+48*arr.count+10);
            mainScroll.contentSize = CGSizeMake(WIDTH,viewDetail.frame.size.height);

        }
        
        [viewDetail.btnGiveReview addTarget:self action:@selector(tapGiveRating:) forControlEvents:UIControlEventTouchUpInside];
        
    } @catch (NSException *exception) {
        
    } @finally {
    
    }
}


-(void)tapGiveRating:(UIButton *)sender
{
    GiveRatingVC *obj = [[[NSBundle mainBundle]loadNibNamed:@"ViewRating" owner:self options:nil]objectAtIndex:0];
    obj.info = dic;
    [self.navigationController pushViewController:obj animated:YES];    
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

-(void)sliderRunning
{
    if (viewDetail.scrollSlieder.contentOffset.x>(viewDetail.scrollSlieder.contentSize.width-10))
    {
        [viewDetail.scrollSlieder setContentOffset:CGPointMake(0, 0)];
    }
    else
    {
        [viewDetail.scrollSlieder setContentOffset:CGPointMake(viewDetail.scrollSlieder.contentOffset.x+WIDTH, 0) animated:YES];
    }
}
@end
