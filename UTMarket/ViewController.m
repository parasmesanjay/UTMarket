//
//  ViewController.m
//  UTMarket
//
//  Created by Ashish sharma on 13/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setTextFieldBorder:txtEmail];
    [self setTextFieldBorder:txtPass];
    
    [self placholderTextColorChange:@"Enter email address..." :txtEmail];
    [self placholderTextColorChange:@"Enter password..." :txtPass];
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
//change the color and text value for place holder...

-(void)placholderTextColorChange:(NSString *)textValue :(UITextField *)textField
{
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:textValue attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    textField.attributedPlaceholder=str;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
