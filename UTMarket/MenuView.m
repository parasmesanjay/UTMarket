//
//  MenuView.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

@synthesize imgProfile, lblName;

- (void)drawRect:(CGRect)rect
{
    imgProfile.layer.cornerRadius = 50;
    imgProfile.layer.masksToBounds = YES;
    
    NSData *userData = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_data_c"];
    NSDictionary *DictUserDetails = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    NSString *image = [NSString stringWithFormat:@"%@",DictUserDetails[@"image"]];
    
    UIImage *img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]]];
    
    imgProfile.image = img;
    
    lblName.text = User_name;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.frame = CGRectMake(0, 20, WIDTH, HEIGHT);
        //_drewerView.frame = CGRectMake(WIDTH/3*2,0,WIDTH, HEIGHT);
    }];}

- (IBAction)HideMenuView:(id)sender
{
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        //_drewerView.frame = CGRectMake(0,0,WIDTH, HEIGHT);
        self.frame = CGRectMake(-WIDTH/3*2, 20,WIDTH,HEIGHT);
    } completion:^(BOOL finished)
    {
        [self removeFromSuperview];
    }];
}

- (IBAction)btnMenuClk:(UIButton *)sender
{
    if (sender.tag == 0)
    {
        NSArray *nav_array = [self.selfBack.navigationController viewControllers];
        int count = 0;
        for (UIViewController *controller in nav_array)
        {
            if ([controller isKindOfClass:[HomeVC class]])
            {
                //Do not forget to import AnOldViewController.h
                count++;
                [self.selfBack.navigationController popToViewController:controller animated:NO];
                return;
            }
        }
        if (count==0)
        {
            UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HomeVC *obj = [storybord instantiateViewControllerWithIdentifier:@"HomeVC"];
            [self.selfBack.navigationController pushViewController:obj animated:NO];
            
        }
    }
    else if (sender.tag == 1)
    {
        NSArray *nav_array = [self.selfBack.navigationController viewControllers];
        int count = 0;
        for (UIViewController *controller in nav_array)
        {
            if ([controller isKindOfClass:[ProfileEditVC class]])
            {
                //Do not forget to import AnOldViewController.h
                count++;
                [self.selfBack.navigationController popToViewController:controller animated:NO];
                return;
            }
        }
        if (count==0)
        {
            UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ProfileEditVC *obj = [storybord instantiateViewControllerWithIdentifier:@"ProfileEditVC"];
            [self.selfBack.navigationController pushViewController:obj animated:NO];
            
        }
    }
    else if (sender.tag == 2)
    {
        NSArray *nav_array = [self.selfBack.navigationController viewControllers];
        int count = 0;
        for (UIViewController *controller in nav_array)
        {
            if ([controller isKindOfClass:[HomeVC class]])
            {
                //Do not forget to import AnOldViewController.h
                count++;
                [self.selfBack.navigationController popToViewController:controller animated:NO];
                return;
            }
        }
        if (count==0)
        {
            UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HomeVC *obj = [storybord instantiateViewControllerWithIdentifier:@"HomeVC"];
            [self.selfBack.navigationController pushViewController:obj animated:NO];
            
        }
    }
    else if (sender.tag == 3)
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Logout" message:@"Are you sure logout ?" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){  }];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                   {
                                       [[NSUserDefaults standardUserDefaults] setObject:NULL forKey:@"user_data_c"];
                                       [[NSUserDefaults standardUserDefaults] setObject:NULL forKey:@"UserID"];
                                       [[NSUserDefaults standardUserDefaults] setObject:NULL forKey:@"name"];
                                       // **************** ****************
                                       
                                       NSArray *nav_array = [self.selfBack.navigationController viewControllers];
                                       int count = 0;
                                       for (UIViewController *controller in nav_array)
                                       {
                                           if ([controller isKindOfClass:[ViewController class]])
                                           {
                                               //Do not forget to import AnOldViewController.h
                                               count++;
                                               [self.selfBack.navigationController popToViewController:controller animated:YES];
                                               return;
                                           }
                                       }
                                       if (count==0)
                                       {
                                           UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                                           ViewController *obj = [storybord instantiateViewControllerWithIdentifier:@"ViewController"];
                                           [self.selfBack.navigationController pushViewController:obj animated:YES];
                                           
                                       }
                                       
                                   }];
        [alertController addAction:cancelAction ];
        [alertController addAction:okAction];
        [self.selfBack presentViewController:alertController animated:YES completion:nil];
        
    }
    
    
    [self performSelector:@selector(HideMenuView:) withObject:nil afterDelay:1];
}

@end
