//
//  ViewHeader.m
//  Town House
//
//  Created by Apple on 21/12/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewHeader.h"
@implementation ViewHeader

- (void)drawRect:(CGRect)rect
{

}
- (IBAction)tapBack:(id)sender {
    [self.selfBack.navigationController popViewControllerAnimated:YES];
}
- (IBAction)tapSideMenu:(id)sender {
    
//    DrewerView *view = [[[NSBundle mainBundle]loadNibNamed:@"DrewerView" owner:self options:nil]objectAtIndex:0];
//    view.selfBack = self.selfBack;
//    [self.selfBack.view addSubview:view];
}

@end