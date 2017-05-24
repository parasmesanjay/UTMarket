//
//  UploadVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "UploadVC.h"

@interface UploadVC ()

@end

@implementation UploadVC
{
    NSInteger select_File;
    
    NSMutableArray *images;
}

@synthesize IsPhoto;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    select_File = 0;
    
    btnUpload.layer.cornerRadius = 5;
    btnUpload.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSelectClk:(id)sender
{
    if (IsPhoto)
    {
        [APPhotoLibrary sharedInstance].delegate = self;
        [[APPhotoLibrary sharedInstance]openPhotoFromCameraAndLibrary:self];
    }
    else
    {
        [APPhotoLibrary sharedInstance].delegate = self;
        [[APPhotoLibrary sharedInstance]openVideoFromCameraAndLibrary:self];
    }
}

-(void)apActionSheetGetImage:(UIImage *)selectedPhoto
{
    imgThumb.image = selectedPhoto;
    images = [NSMutableArray array];
    [images addObject:selectedPhoto];

    select_File = 1;
}

-(void)apActionSheetGetVideo:(NSURL *)selectedVideo
{
    NSData *videoData = [NSData dataWithContentsOfURL:selectedVideo];
    
    images = [NSMutableArray array];
    [images addObject:videoData];
    
    select_File = 1;
}

-(void)apActionSheetGetVideoThumbImage:(UIImage *)selectedVideoThumbImage
{
    imgThumb.image = selectedVideoThumbImage;

}

-(void)APPImagePickerControllerDidCancel
{
    /*images = [NSMutableArray array];
    
    select_File = 0;*/
}

- (IBAction)btnUploadClk:(id)sender
{
    if (select_File == 0)
    {
        [WebServiceCalls alert:@"Select File First."];
    }
    else
    {
        [self uploadFile];
    }
}

-(void) uploadFile
{
//    AFHTTPSessionManager *manager;
//    manager = [[AFHTTPSessionManager alloc]init];
//    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments | NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    manager.securityPolicy.allowInvalidCertificates = YES;//This is for https
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    @try
    {
        // ************************* Progress view setup *************************
        
        /*uploadingView.hidden = _lblUploading.hidden = barProgress.hidden = lblProgressCount.hidden = NO;
        
        uploadingView.layer.cornerRadius = 10;
        uploadingView.layer.masksToBounds = YES;
        
        [[barProgress layer]setFrame:CGRectMake(barProgress.frame.origin.x, barProgress.frame.origin.y, barProgress.frame.size.width, 4)];
        
        [[barProgress layer]setCornerRadius:barProgress.frame.size.height / 2];
        [[barProgress layer]setMasksToBounds:TRUE];
        barProgress.clipsToBounds = YES;*/
        
        //[barProgress setProgress:0.01];
        
        // *************************  *************************
        
        // http://appone.biz/UTMarket/index.php?route=feed/rest_api/addPhoto
        // http://appone.biz/UTMarket/index.php?route=feed/rest_api/addVideo
        
        NSString *url;
        NSDictionary *dictUpload;
        
        if (IsPhoto)
        {
            url = [NSString stringWithFormat:@"http://appone.biz/UTMarket/index.php?route=feed/rest_api/addPhoto"];
            dictUpload = @{@"title":@""};
        }
        else
        {
            url = [NSString stringWithFormat:@"http://appone.biz/UTMarket/index.php?route=feed/rest_api/addVideo"];
            dictUpload = nil;

        }
        
        SVHUD_START
        
        [manager POST:url parameters:dictUpload constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
        {
            for (int i = 0; i < images.count; i++)
            {
                if (!IsPhoto)
                {
                    //NSData *image_data1 = UIImageJPEGRepresentation(images[i],0.1);
                    
                    NSString *date = [self isDateTime];
                    
                    NSString *fName = [NSString stringWithFormat:@"%@_Video%d_iPhone.mp4", date, i];
                    
                    NSString *parameter = [NSString stringWithFormat:@"video"];
                    
                    [formData appendPartWithFileData:images[i] name:parameter fileName:fName mimeType:@"video/mp4"];
                    //video/mp4
                }
                else
                {
                    UIImage *img = images[i];
                    
                    NSData *image_data1 = UIImageJPEGRepresentation(img,0.1);
                    
                    NSString *date = [self isDateTime];
                    
                    NSString *fName = [NSString stringWithFormat:@"%@_image%d_iPhone.jpg", date, i];
                    
                    NSString *parameter = [NSString stringWithFormat:@"image"];
                    
                    [formData appendPartWithFileData:image_data1 name:parameter fileName:fName mimeType:@"image/jpeg"];
                }
            }
        } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
         {
            @try
            {
                NSMutableArray * responseJson = [[NSMutableArray alloc]init];
                responseJson = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                
                NSLog(@"%@",responseJson);
                                
                if ([responseObject[@"success"] integerValue] == 1)
                {
                    
                    /*[barProgress setProgress:1.0];
                     lblProgressCount.text = [NSString stringWithFormat:@"100 %@", @"%"];
                     
                     [AppDelegate AppDelegate].uploadFile = 1;*/
                    
                    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Success !" message:@"Successfully Uploaded." preferredStyle:UIAlertControllerStyleAlert];
                    
                    //UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){  }];
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                               {
                                                   /*uploadingView.hidden = YES;
                                                    [barProgress setProgress:0.01];
                                                    lblProgressCount.text = [NSString stringWithFormat:@"0 %@", @"%"];*/
                                                   
                                               }];
                    //[alertController addAction:cancelAction ];
                    [alertController addAction:okAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                }
                else
                {
                    UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Failed !" message:@"Failed to Upload." preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                                               {
                                                   /*uploadingView.hidden = YES;
                                                    [barProgress setProgress:0.01];
                                                    lblProgressCount.text = [NSString stringWithFormat:@"0 %@", @"%"];*/
                                               }];
                    [alertController addAction:okAction];
                    [self presentViewController:alertController animated:YES completion:nil];
                }
                
            }
            @catch (NSException *exception)
            {
                [SVProgressHUD dismiss];
            }
            @finally
            {
                [SVProgressHUD dismiss];
                
                /*images = [NSMutableArray array];
                 lblSelectedFileCount.text = [NSString stringWithFormat:@"0 File Selected"];*/
            }
            
         } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error)
        {
            [SVProgressHUD dismiss];
            
            /*uploadingView.hidden = YES;
             [barProgress setProgress:0.01];
             lblProgressCount.text = [NSString stringWithFormat:@"0 %@", @"%"];*/
            
            [WebServiceCalls alert:@"Failed to Upload."];
        }];
        /*[manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData)
         {
             
             
         } progress:^(NSProgress * _Nonnull uploadProgress)
         {
             progressCount = (float)uploadProgress.fractionCompleted;
             
             [self performSelectorOnMainThread:@selector(makeMyProgressBarMoving) withObject:nil waitUntilDone:NO];
             
             //NSLog(@"%@", uploadProgress);
             
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable JSON)
         {
             //[SVProgressHUD dismiss];
             
             
             
         }
              failure:^(NSURLSessionDataTask *dataTask, NSError *error)
         {
             
         }];*/
        
    }
    @catch (NSException *exception)
    {
        [SVProgressHUD dismiss];
    }
    @finally
    {
        //[SVProgressHUD dismiss];
    }
    
}

-(NSString *)isDateTime
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddhhmmss";
    return [dateFormatter stringFromDate:[NSDate date]];
}

@end
