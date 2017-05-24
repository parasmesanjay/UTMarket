//
//  CategoryVC.h
//  UTMarket
//
//  Created by Ashish sharma on 22/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryVC : UIViewController<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic,strong) NSDictionary *dic;
@property (nonatomic,readwrite) NSInteger tag;
@end
