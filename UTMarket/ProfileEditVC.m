//
//  ProfileEditVC.m
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 26/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ProfileEditVC.h"

@interface ProfileEditVC ()

@end

@implementation ProfileEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    testlbl.numberOfLines = 0;
//    testlbl.text = @"Enter large amount of text here";
//    [testlbl sizeToFit];
    
    GET_HEADER_VIEW
    
    UpdateBtn.layer.borderWidth  = 2;
    UpdateBtn.layer.borderColor  = [WHITE_COLOR CGColor];
    
    _UserImg.layer.cornerRadius = 60;
    _UserImg.layer.masksToBounds = YES;
    
     _Firstnametxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter First Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    _Lastnametxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Last Name" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    _ContactTxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Contact No." attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    NSData *userData = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_data_c"];
    NSDictionary *DictUserDetails = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    NSString *image = [NSString stringWithFormat:@"%@",DictUserDetails[@"image"]];
    
    _UserImg.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:image]]];
    
    //[UpdateBtn setBackgroundImage:img forState:UIControlStateNormal];
}

-(IBAction)clickForupdateImg:(id)sender

    {
        [APPhotoLibrary sharedInstance].delegate = self;
        [[APPhotoLibrary sharedInstance]openPhotoFromCameraAndLibrary:self];
    }
    
-(void)apActionSheetGetImage:(UIImage *)selectedPhoto
    {
        CGSize newSize = CGSizeMake(500,500);
        UIGraphicsBeginImageContext(newSize);
        [selectedPhoto drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        _UserImg.image = newImage;
        
    
        
    }
    
    
    
    
    
-(void)apActionSheetGetVideo:(NSURL *)selectedVideo
    {
        
    }

-(void)apActionSheetGetVideoThumbImage:(UIImage *)selectedVideoThumbImage
    {
        
    }

-(IBAction)clickforUpdate:(id)sender
{
    [self UpdateProfile];
    
}




-(void)UpdateProfile
{
    NSData *userData = [[NSUserDefaults standardUserDefaults]objectForKey:@"user_data_c"];
    NSDictionary *DictUserDetails = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:userData];
    NSString *email = [NSString stringWithFormat:@"%@",DictUserDetails[@"email"]];

    NSString *jsonString = [NSString stringWithFormat:@"{\"user_id\":\"%@\",\"email\":\"%@\",\"firstname\":\"%@\",\"lastname\":\"%@\",\"telephone\":\"%@\"}",UserID,email,_Firstnametxt.text,_Lastnametxt.text,_ContactTxt.text];
    
    [WebServiceCalls POSTJSON:@"updateProfile" parameter:jsonString completionBlock:^(id JSON, WebServiceResult result)
     {
         SVHUD_STOP
         
         @try {
             
             //NSLog(@"%@",JSON);
             if ([JSON[@"success"] integerValue] == 1)
             {

                 UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                 HomeVC *obj = [storybord instantiateViewControllerWithIdentifier:@"HomeVC"];
                 [self.navigationController pushViewController:obj animated:NO];
                 
             }
             else
             {
                 [WebServiceCalls warningAlert:@"Email or password incorrect."];
             }
             
         } @catch (NSException *exception) {
             
         } @finally {
             
         }
         
     }];
    
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
