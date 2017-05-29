//
//  ForgetPassVC.m
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 29/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ForgetPassVC.h"

@interface ForgetPassVC ()

@end

@implementation ForgetPassVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    GET_HEADER_VIEW_WITH_BACK
    
    txtmail.borderStyle = UITextBorderStyleRoundedRect;
    // Do any additional setup after loading the view.
}

-(IBAction)ClickAfterMail:(id)sender
{
   
    [self SendmailApi];
    
    
}


-(void)SendmailApi
{
 
//    
//    NSString *jsonString = [NSString stringWithFormat:@"{\"user_id\":\"%@\"}",txtmail.text];
//    
//    [WebServiceCalls POSTJSON:@"forgotPassword" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
//     {
//         SVHUD_STOP
//         
//         @try {
//             
//             NSLog(@"%@",JSON);
//             if ([JSON[@"success"] integerValue] == 1)
//             {
//                 [UIView animateWithDuration:0.2 animations:^{
//                     TokenView.frame = CGRectMake(0,TokenView.frame.origin.y,WIDTH,TokenView.frame.size.height);
//                 }];
//               
//                 
//             }
//             else
//             {
//                 [WebServiceCalls warningAlert:@"Email  incorrect."];
//             }
//             
//         } @catch (NSException *exception) {
//             
//         } @finally {
//             
//         }
//         
//     }];
    
}

-(IBAction)ClickAfterToken:(id)sender
{
    
}

-(IBAction)ClickAfterNewPass:(id)sender
{
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
