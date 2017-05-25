//
//  VideoVC.h
//  UTMarket
//
//  Created by Ashish Kumar Sharma on 25/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoVC : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
{
    
    IBOutlet UICollectionView *collViewVideo;
    
}

@end
