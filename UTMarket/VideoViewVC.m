//
//  VideoViewVC.m
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "VideoViewVC.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface VideoViewVC ()

@end

@implementation VideoViewVC
{
    AVPlayerViewController *playerViewController;
    AVPlayer * player;
}

@synthesize Url;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GET_HEADER_VIEW_WITH_BACK

    NSString *str = [NSString stringWithFormat:@"http://appone.biz/UTMarket/%@",Url];
    
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *url = [NSURL URLWithString:str];
    
    AVURLAsset *asset = [AVURLAsset assetWithURL: url];
    AVPlayerItem *item = [AVPlayerItem playerItemWithAsset: asset];
    
    player = [[AVPlayer alloc] initWithPlayerItem: item];
    
    playerViewController = [[AVPlayerViewController alloc] init];
    playerViewController.player = player;
    [playerViewController.view setFrame:CGRectMake(0,mainView.frame.origin.y, WIDTH, mainView.frame.size.height)];
    
    playerViewController.showsPlaybackControls = YES;
    [self.view addSubview:playerViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
