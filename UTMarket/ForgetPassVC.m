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

@implementation ForgetPassVC{
    NSString *userid;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    GET_HEADER_VIEW_WITH_BACK
    
    header.lblTitle.text = @"Forget Password";
    
    txtmail.borderStyle = UITextBorderStyleRoundedRect;
    txtToken.borderStyle = UITextBorderStyleRoundedRect;
    txtNewPass.borderStyle = UITextBorderStyleRoundedRect;

    
    // Do any additional setup after loading the view.
}

-(IBAction)ClickAfterMail:(id)sender
{
   
    [self SendmailApi];
    
    
}


-(void)SendmailApi
{
 
    
    NSString *jsonString = [NSString stringWithFormat:@"{\"email\":\"%@\"}",txtmail.text];
    
    [WebServiceCalls POSTJSON:@"forgotPassword" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         
         @try {
             
             NSLog(@"%@",JSON);
             if ([JSON[@"success"] integerValue] == 1)
             {
                 
                 userid = [NSString stringWithFormat:@"%@",JSON[@"user_id"]];
                 
                 [UIView animateWithDuration:0.2 animations:^{
                     TokenView.frame = CGRectMake(0,TokenView.frame.origin.y,WIDTH,TokenView.frame.size.height);
                 }];
                 
                 TokenView.hidden = NO;
               
                 
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Email  incorrect."];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             
         }
         
     }];
    
}

-(IBAction)ClickAfterToken:(id)sender
{
   
    [self SendTokenApi];
    
    
}

-(void)SendTokenApi
{
    
    
    NSString *jsonString = [NSString stringWithFormat:@"{\"user_id\":\"%@\",\"code\":\"%@\"}",userid,txtToken.text];
    
    [WebServiceCalls POSTJSON:@"email_verification" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         
         @try {
             
             NSLog(@"%@",JSON);
             if ([JSON[@"success"] integerValue] == 1)
             {
                 [UIView animateWithDuration:0.2 animations:^{
                     TokenView.frame = CGRectMake(WIDTH,TokenView.frame.origin.y,WIDTH,TokenView.frame.size.height);
                 }];
                 
                 TokenView.hidden = YES;
                 
                 
                 
                 [UIView animateWithDuration:0.2 animations:^{
                     UpdatePassView.frame = CGRectMake(0,UpdatePassView.frame.origin.y,WIDTH,UpdatePassView.frame.size.height);
                 }];
                 
                 UpdatePassView.hidden = NO;
                 
                 
                 
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Token  incorrect."];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             
         }
         
     }];
    
}


-(IBAction)ClickAfterNewPass:(id)sender
{
    if (txtNewPass.text.length<1)
    {
        [WebServiceCalls warningAlert:@"Set Password Correctly"];

    }
    else
    {
        
    [self NewPassApi];
        
    }
}


-(void)NewPassApi
{
    
    
NSString *jsonString = [NSString stringWithFormat:@"{\"user_id\":\"%@\",\"password\":\"%@\"}",txtmail.text,txtNewPass.text];
    
    [WebServiceCalls POSTJSON:@"resetPassword" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         
         @try {
             
             NSLog(@"%@",JSON);
             if ([JSON[@"success"] integerValue] == 1)
             {
                 
                 
                 [UIView animateWithDuration:0.2 animations:^{
                     UpdatePassView.frame = CGRectMake(-WIDTH,UpdatePassView.frame.origin.y,WIDTH,UpdatePassView.frame.size.height);
                 }];
                 
                 UpdatePassView.hidden = YES;
                 
                 
                 UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                 ViewController *obj = [storybord instantiateViewControllerWithIdentifier:@"ViewController"];
                 [self.navigationController pushViewController:obj animated:NO];
                 
                 
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Password Not Updated"];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             
         }
         
     }];
    
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
