//
//  ViewHeader.m
//  Town House
//
//  Created by Apple on 21/12/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ViewHeader.h"
@implementation ViewHeader
{
    MenuView *menu;
}

- (void)drawRect:(CGRect)rect
{

}

- (IBAction)tapBack:(id)sender
{
    [self.selfBack.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapSideMenu:(id)sender
{
    menu = [[[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:self options:nil] objectAtIndex:0];
    menu.frame = CGRectMake(-2*WIDTH/3,20,WIDTH,HEIGHT);
    menu.selfBack =_selfBack;
    menu.drewerView = _drewerView;
    [self.selfBack.view addSubview:menu];
}
@end
