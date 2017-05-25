//
//  GiveRatingVC.m
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "GiveRatingVC.h"

@interface GiveRatingVC ()

@end

@implementation GiveRatingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Review to Item";
    
    btnSubmit.layer.cornerRadius = 5;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)tapSubmit:(id)sender {
    
    
    if (textFeedback.text.length > 10) {
        
        HIDE_KEY
        SVHUD_START
        [self performSelector:@selector(fireJson) withObject:nil afterDelay:0];

    }
    else
        [WebServiceCalls warningAlert:@"Feedback Must be more than 10 Character"];
    
//    [25/05/17, 4:59:10 PM] hansraj sirohiya: http://appone.biz/UTMarket/index.php?route=feed/rest_api/addreviews
//    [25/05/17, 4:59:29 PM] hansraj sirohiya: parameter de raha hu
//    [25/05/17, 5:03:41 PM] hansraj sirohiya: {
//        "name":"userName",
//        "text": "comment",
//        "rating":"rating",
//        "category_id":"maincategory_id",
//        "sub_category_id":" sub_category_id",
//        "user_id":" user_id",
//        "product_id":" product_id"
//    }
//
    
    
}

-(void)fireJson
{
//    NSString *jsonString = [NSString stringWithFormat:@"{\"name\":\"%@\",\"text\":\"%@\",\"rating\":\"%@\",\"category_id\":\"%@\",\"sub_category_id\":\"%@\",\"user_id\":\"%@\",\"product_id\":\"%@\"}",UserID,textFeedback.text];
//    
//    [WebServiceCalls POSTJSON:@"email_verification" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
//     {
//         SVHUD_STOP
//         
//         @try {
//             
//             if ([JSON[@"success"] integerValue] == 1)
//             {
//                 NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:JSON[@"data"]];
//                 [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"user_data_c"];
//                 
//                 UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//                 UIViewController *con = [storybord instantiateViewControllerWithIdentifier:@"HomeVC"];
//                 [self.navigationController pushViewController:con animated:YES];
//                 
//             }
//             else
//             {
//                 [WebServiceCalls warningAlert:@"Email Already Used."];
//             }
//             
//         } @catch (NSException *exception) {
//             
//         } @finally {
//             SVHUD_STOP
//         }
//         
//     }];
}


@end
