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
    textTocken.borderStyle = UITextBorderStyleRoundedRect;
    btnSubmint.layer.cornerRadius = 5;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapSubmit:(id)sender {
    
}

@end
