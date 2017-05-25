//
//  VideoVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "VideoVC.h"

@interface VideoVC ()

@end

@implementation VideoVC
{
    NSArray *arrVideo;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Videos";

    [self imageHud];
}

-(void) imageHud
{
    // http://appone.biz/UTMarket/index.php?route=feed/rest_api/photos
    [SVProgressHUD showWithStatus:@"Loading.."];
    [WebServiceCalls GET:@"videos" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
     {
         
         [SVProgressHUD dismiss];
         NSLog(@"%@",JSON);
         @try
         {
             arrVideo = JSON[@"data"];
             [collViewVideo reloadData];
         }
         @catch (NSException *exception)
         {
             [WebServiceCalls alert:@"Somthing Wrong\nPlease try again."];
             POP_BACK
         }
         @finally
         {
             
         }
         
     }];
}

#pragma Mark CollectionView Datasources & Delegates

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return arrVideo.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((WIDTH/2)-5, (WIDTH/2)-5);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collViewVideoCell" forIndexPath:indexPath];
    
    UIImageView *imgView = [cell viewWithTag:1];
    
    imgView.image = [UIImage imageNamed:@"play.png"];
    
    /*NSString *str = [NSString stringWithFormat:@"http://appone.biz/UTMarket/%@",arrVideo[indexPath.row][@"video"]];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:str];
    
    [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question.png"]];*/
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VideoViewVC *obj = [storybord instantiateViewControllerWithIdentifier:@"VideoViewVC"];
    obj.Url = arrVideo[indexPath.row][@"video"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
