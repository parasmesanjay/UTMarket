//
//  Review_Statement_VC.h
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 26/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Review_Statement_VC : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *tblview;
    
}

@property (nonatomic,strong) NSString *productid;
@property (nonatomic,strong) NSArray *Array;

@end
