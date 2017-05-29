//
//  FeedbackVC.m
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 29/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "FeedbackVC.h"

@interface FeedbackVC ()

@end

@implementation FeedbackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GET_HEADER_VIEW
    header.lblTitle.text = @"Feedback";
    
      nametxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
      Emailtxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Mail" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    btnSend.layer.borderWidth = 2;
    btnSend.layer.borderColor = [WHITE_COLOR CGColor];
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
