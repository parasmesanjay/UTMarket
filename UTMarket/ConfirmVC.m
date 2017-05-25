//
//  ConfirmVC.m
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ConfirmVC.h"

@interface ConfirmVC ()
{
    IBOutlet UIButton *btnSubmint;
    IBOutlet UITextField *textTocken;
}
@end

@implementation ConfirmVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Mail Verification";
    
    textTocken.borderStyle = UITextBorderStyleRoundedRect;
    btnSubmint.layer.cornerRadius = 5;
    
    textTocken.placeholder = @"Place you token";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapSubmit:(id)sender {
    
    if (textTocken.text.length > 3)
    {
        HIDE_KEY
        SVHUD_START
        [self performSelector:@selector(fireJson) withObject:nil afterDelay:0];
    }
    else
        [WebServiceCalls warningAlert:@"Enter Valid Code"];
    
}

-(void)fireJson
{
    NSString *jsonString = [NSString stringWithFormat:@"{\"user_id\":\"%@\",\"code\":\"%@\"}",UserID,textTocken.text];
    
    
    [WebServiceCalls POSTJSON:@"email_verification" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         
         @try {
             
             if ([JSON[@"success"] integerValue] == 1)
             {
                 NSData *myData = [NSKeyedArchiver archivedDataWithRootObject:JSON[@"data"]];
                 [[NSUserDefaults standardUserDefaults] setObject:myData forKey:@"user_data_c"];
                
                 UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                 UIViewController *con = [storybord instantiateViewControllerWithIdentifier:@"HomeVC"];
                 [self.navigationController pushViewController:con animated:YES];
                 
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Email Already Used."];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             SVHUD_STOP
         }
         
     }];

}

HIDE_KEY_ON_TOUCH
@end
