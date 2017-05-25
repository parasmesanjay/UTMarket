//
//  ImageVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "ImageVC.h"

@interface ImageVC ()

@end

@implementation ImageVC
{
    NSArray *arrImage;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = @"Photos";
    
    [self imageHud];
}

-(void) imageHud
{
    // http://appone.biz/UTMarket/index.php?route=feed/rest_api/photos
    [SVProgressHUD showWithStatus:@"Loading.."];
    [WebServiceCalls GET:@"photos" parameter:nil completionBlock:^(id JSON, WebServiceResult result)
    {
        
        [SVProgressHUD dismiss];
        NSLog(@"%@",JSON);
        @try
        {
            arrImage = JSON[@"data"];
            [collViewImage reloadData];
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
    return arrImage.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((WIDTH/2)-5, (WIDTH/2)-5);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collViewImageCell" forIndexPath:indexPath];
    
    UIImageView *imgView = [cell viewWithTag:1];
    
    NSString *str = [NSString stringWithFormat:@"http://appone.biz/UTMarket/image/%@",arrImage[indexPath.row][@"image"]];
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:str];
    
    [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"question.png"]];
    
    UILabel *lbl = [cell viewWithTag:2];
    
    lbl.text = arrImage[indexPath.row][@"title"];
    
    if (lbl.text.length < 1)
    {
        lbl.hidden = YES;
    }
    else
    {
        lbl.hidden = NO;
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storybord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ImageViewVC *obj = [storybord instantiateViewControllerWithIdentifier:@"ImageViewVC"];
    obj.Url = arrImage[indexPath.row][@"image"];
    [self.navigationController pushViewController:obj animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
