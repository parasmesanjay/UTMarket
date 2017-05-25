//
//  HomeVC.m
//  UTMarket
//
//  Created by Ashish sharma on 22/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "HomeVC.h"
#import "CategoryVC.h"
@interface HomeVC ()
{
    NSArray *array;
}
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HIDE_NAV_BAR
    img.image =  [img.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    [SVProgressHUD showWithStatus:@"Loading.."];
    [WebServiceCalls GET:@"categories" parameter:nil completionBlock:^(id JSON, WebServiceResult result){
        
        [SVProgressHUD dismiss];
        NSLog(@"%@",JSON);
        
        array = JSON[@"data"];
    }];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)tapButton:(UIButton *)sender {
    
    CategoryVC *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"CategoryVC"];
    obj.dic = array[sender.tag];
    obj.tag = sender.tag;
    [self.navigationController pushViewController:obj animated:YES];
}

@end
