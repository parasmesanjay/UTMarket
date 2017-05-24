//
//  CategoryVC.m
//  UTMarket
//
//  Created by Ashish sharma on 22/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "CategoryVC.h"
#import "DataListVC.h"

@interface CategoryVC ()
{
    IBOutlet UITableView *table;
    NSArray *arrayCats;
}
@end

@implementation CategoryVC

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    GET_HEADER_VIEW_WITH_BACK
    header.lblTitle.text = _dic[@"category_name"];
    
    arrayCats = _dic[@"sub_categories"];
    table.dataSource = self;
    table.delegate = self;
    
    [table reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

#pragma mark Table View Delegate and Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayCats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    UILabel *label = [cell viewWithTag:1];
    label.text = arrayCats[indexPath.row][@"name"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataListVC *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"DataListVC"];
    obj.info = arrayCats[indexPath.row];
    obj.tag = _tag;

    [self.navigationController pushViewController:obj animated:YES];

}

@end
