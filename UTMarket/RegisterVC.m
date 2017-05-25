//
//  RegisterVC.m
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()
{

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

    NSArray *arr = @[mobile,password,email,lastName,firstName];
    
    for (UITextField *txt in arr)
    {
        [self placholderTextColorChange:txt.placeholder :txt];
        [self setTextFieldBorder:txt];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapCreateAccount:(id)sender {
    
}

- (IBAction)tapAlready:(id)sender {
    
}


-(void)setTextFieldBorder:(UITextField *)textField{
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 2;
    border.borderColor = [UIColor whiteColor].CGColor;
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, 2);
    border.borderWidth = borderWidth;
    [textField.layer addSublayer:border];
    textField.layer.masksToBounds = YES;
}

// change the color and text value for place holder...

-(void)placholderTextColorChange:(NSString *)textValue :(UITextField *)textField
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:textValue attributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }];
    
    textField.attributedPlaceholder=str;
}
@end
