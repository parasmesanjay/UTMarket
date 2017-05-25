//
//  RegisterVC.m
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "RegisterVC.h"
#import "ConfirmVC.h"
@interface RegisterVC ()<UIGestureRecognizerDelegate,UITextFieldDelegate>
{
    IBOutlet TPKeyboardAvoidingScrollView *mainScroll;

    IBOutlet UITextField *mobile;
    IBOutlet UITextField *password;
    IBOutlet UITextField *email;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *firstName;
    
}
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];

    STATUS_BAR_WHITE
    
    NSArray *arr = @[mobile,password,email,lastName,firstName];
    
    for (UITextField *txt in arr)
    {
        [self placholderTextColorChange:txt.placeholder :txt];
        [self setTextFieldBorder:txt];
    }
    
    [mainScroll setContentSize:CGSizeMake(WIDTH,700)];
    mobile.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapCreateAccount:(id)sender {
    
    if (firstName.text.length > 0 && lastName.text.length > 0 && email.text.length > 0&& password.text.length > 0 && mobile.text.length > 0) {
        
        if ([WebServiceCalls isValidEmail:email.text])
        {
            HIDE_KEY
            SVHUD_START
            [self performSelector:@selector(fireJson) withObject:nil afterDelay:0];
        }
        else
            [WebServiceCalls warningAlert:@"Enter valid email first."];

    }
    else
        [WebServiceCalls warningAlert:@"Required All Fields"];
}

- (IBAction)tapAlready:(id)sender {
    POP_BACK
}

-(void)fireJson
{
    NSString *jsonString = [NSString stringWithFormat:@"{\"email\":\"%@\",\"firstname\":\"%@\",\"lastname\":\"%@\",\"mobile_no\":\"%@\",\"password\":\"%@\"}",email.text,firstName.text,lastName.text,mobile.text,password.text];
    
    
    [WebServiceCalls POSTJSON:@"register" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
      SVHUD_STOP
         
         @try {
             
             //NSLog(@"%@",JSON);
             if ([JSON[@"success"] integerValue] == 1)
             {
                 [[NSUserDefaults standardUserDefaults] setObject:JSON forKey:@"user_data"];
                 [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%@",JSON[@"user_id"]] forKey:@"UserID"];
                 
                 ConfirmVC *obj = [[[NSBundle mainBundle]loadNibNamed:@"Register" owner:self options:nil]objectAtIndex:1];
                 [self.navigationController pushViewController:obj animated:YES];
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Email Already Used."];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             
         }
         
     }];

}


-(void)setTextFieldBorder:(UITextField *)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 1;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, 1);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
}

// change the color and text value for place holder...

-(void)placholderTextColorChange:(NSString *)textValue :(UITextField *)textField
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:textValue attributes:@{ NSForegroundColorAttributeName : [UIColor lightTextColor] }];
    
    textField.attributedPlaceholder=str;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == mobile)
    {
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <=10;
    }
    else
        return YES;
    
}
@end
