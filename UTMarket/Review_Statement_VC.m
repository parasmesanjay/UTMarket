//
//  Review_Statement_VC.m
//  UTMarket
//
//  Created by Upendra Singh Shekhawat on 26/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "Review_Statement_VC.h"

@interface Review_Statement_VC ()

@end

@implementation Review_Statement_VC{
    NSArray *array;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    array = @[@"This is the demo statement. This is the demo statement. This is the demo statement. This is the demo statement. ",@" This is the demo statement. This is the demo statement.",@"This is the demo statement."];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tblview dequeueReusableCellWithIdentifier:@"cell"];
    
    UIView *viewstar = [[UIView alloc]initWithFrame:CGRectMake(10, 5,40, 20)];
    
    viewstar.backgroundColor = [UIColor colorWithRed:83/255.0 green:163/255.0 blue:24/255.0 alpha:1.0];
    UILabel *starcount = [[UILabel alloc]initWithFrame:CGRectMake(5,0,15,20)];
    starcount.contentMode = NSTextAlignmentCenter;
    starcount.text = @"5";
    [starcount setFont: [starcount.font fontWithSize: 14]];

    starcount.textColor = WHITE_COLOR;
    UIImageView *imgstar = [[UIImageView alloc]initWithFrame:CGRectMake(starcount.frame.size.width+5, 3, 14, 14)];
    imgstar.image = [UIImage imageNamed:@"starrr"];
    
    viewstar.layer.cornerRadius = 3;
    viewstar.layer.masksToBounds = YES;
    [viewstar addSubview:starcount];
    [viewstar addSubview:imgstar];
    [cell addSubview: viewstar];
    
    
    UILabel *lblStatment = [[UILabel alloc]initWithFrame:CGRectMake(10, viewstar.frame.size.height + 15, WIDTH-20, 40)];
    lblStatment.text = array[indexPath.row];
    lblStatment.numberOfLines = 0;
    [lblStatment setFont: [lblStatment.font fontWithSize: 15]];

     [lblStatment sizeToFit];
    [cell addSubview:lblStatment];
    
    UILabel *lblusername = [[UILabel alloc]initWithFrame:CGRectMake(10,lblStatment.frame.origin.y + lblStatment.frame.size.height , WIDTH/2 - 20, 40)];
    
    lblusername.text = @"Upendra Singh";
    //[lblusername setFont: [lblusername.font fontWithSize: 15]];
    lblusername.font = [UIFont boldSystemFontOfSize:15];
    [cell addSubview:lblusername];
    
    UILabel *lblfordate = [[UILabel alloc]initWithFrame:CGRectMake(lblusername.frame.size.width + 15, lblusername.frame.origin.y, WIDTH/4 +10, 40)];
    
    lblfordate.text = @"26-05-2017";
    [lblfordate setFont: [lblfordate.font fontWithSize: 14]];

    
    [cell addSubview:lblfordate];
    
    UILabel *lblfortime = [[UILabel alloc]initWithFrame:CGRectMake(lblfordate.frame.size.width + lblfordate.frame.origin.x , lblusername.frame.origin.y, WIDTH/4 - 20, 40)];
    
    lblfortime.text = @"10:10:10";
    [lblfortime setFont: [lblfordate.font fontWithSize: 14]];

    
    [cell addSubview:lblfortime];

    
    
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *cellText = array[indexPath.row];
//    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:17.0];
//    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
//    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDTH-20, 10)];
    lbl1.numberOfLines = 0;
    lbl1.text = array[indexPath.row];
    [lbl1 sizeToFit];
    
    
    return lbl1.frame.size.height + 70;
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
