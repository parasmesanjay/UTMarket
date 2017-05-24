//
//  DataListVC.m
//  UTMarket
//
//  Created by Ashish sharma on 22/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "DataListVC.h"
#import "ViewCell.h"
@interface DataListVC ()

@end

@implementation DataListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Title";
    
    
    [SVProgressHUD showWithStatus:@"Loading.."];
    NSString *urlString;
    
    if ([_info[@"category_id"] integerValue] == 65)
    {
        urlString = @"carSellerAndDealers";
    }
    else if ([_info[@"category_id"] integerValue] == 66)
    {
        urlString = @"carRenters";
    }
    else if ([_info[@"category_id"] integerValue] == 67)
    {
        urlString = @"carPartSellers";
    }
    else if ([_info[@"category_id"] integerValue] == 68)
    {
        urlString = @"CarMechanicLocations";
    }
    else if ([_info[@"category_id"] integerValue] == 71)
    {
        urlString = @"gameReserver";
    }
    else if ([_info[@"category_id"] integerValue] == 72)
    {
        urlString = @"site";
    }
    else if ([_info[@"category_id"] integerValue] == 70)
    {
        urlString = @"tourism";
    }
    else
    {
        urlString = [NSString stringWithFormat:@"properties&category_id=%@",_info[@"category_id"]];
    }
    
    
    [WebServiceCalls GET:urlString parameter:nil completionBlock:^(id JSON, WebServiceResult result)
    {

        [SVProgressHUD dismiss];
        @try
        {
            // NSLog(@"%@",JSON);

            for (int i = 0; i<[JSON[@"data"] count]; i++)
            {
                ViewCell *view = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] objectAtIndex:0];

                int sp = 0;
                if (i%2 == 0)
                    sp = 10;
                else sp = 5;
                
                view.frame = CGRectMake(sp+(WIDTH/2)*(i%2),10+(WIDTH/2-15)*(i/2), WIDTH/2-15, WIDTH/2-15);
                
                [mainScroll addSubview:view];
                
                
                NSString *urlSrting = @"";
                
                if ([_info[@"category_id"] integerValue] == 65)
                {
                    urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",JSON[@"data"][i][@"imagcar_imagee"]];
                    view.name.text = JSON[@"data"][i][@"car_model"];
                    view.price.text = [NSString stringWithFormat:@"₹ %@",JSON[@"data"][i][@"car_price"]];
                }
                else if ([_info[@"category_id"] integerValue] == 66)
                {
                    urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",JSON[@"data"][i][@"car_image"]];
                    view.name.text = JSON[@"data"][i][@"car_model"];
                    view.price.text = [NSString stringWithFormat:@"₹ %@",JSON[@"data"][i][@"car_rent_price"]];
                }
                else if ([_info[@"category_id"] integerValue] == 67)
                {
                    urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",JSON[@"data"][i][@"car_part_image"]];
                    view.name.text = JSON[@"data"][i][@"car_model"];
                    view.price.text = [NSString stringWithFormat:@"₹ %@",JSON[@"data"][i][@"price"]];

                }
                else if ([_info[@"category_id"] integerValue] == 68)
                {
                    urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",JSON[@"data"][i][@"mechanic_image"]];
                    view.name.text = JSON[@"data"][i][@"mechanic_name"];
                    // view.price.text = [NSString stringWithFormat:@"₹ %@",JSON[@"data"][i][@"price"]];
                    view.price.hidden = YES;
                }
                else if ([_info[@"category_id"] integerValue] == 71)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",JSON[@"data"][i][@"agent_image"]];
                    view.name.text = JSON[@"data"][i][@"agent_name"];
                    view.price.hidden = YES;
                }
                else if ([_info[@"category_id"] integerValue] == 72)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",JSON[@"data"][i][@"agent_image"]];
                    view.name.text = JSON[@"data"][i][@"agent_name"];
                    view.price.hidden = YES;
                }
                else if ([_info[@"category_id"] integerValue] == 70)
                {
                    urlSrting = [NSString stringWithFormat:@"%@",JSON[@"data"][i][@"agent_image"]];
                    view.name.text = JSON[@"data"][i][@"agent_name"];
                    view.price.hidden = YES;
                }
                else
                {
                    urlSrting = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",JSON[@"data"][i][@"image"]];
                    view.name.text = JSON[@"data"][i][@"property_name"];
                    view.price.text = [NSString stringWithFormat:@"₹ %@",JSON[@"data"][i][@"price"]];
                }
                
                NSURL *url = [NSURL URLWithString:[urlSrting stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                [view.image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question"]];
            }
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        // // array = JSON[@"data"];
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
