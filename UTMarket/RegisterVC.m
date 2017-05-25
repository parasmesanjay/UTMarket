//
//  RegisterVC.m
//  UTMarket
//
//  Created by Ashish sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()<UIGestureRecognizerDelegate>
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
    
}

- (IBAction)tapAlready:(id)sender {
    POP_BACK
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
@end
