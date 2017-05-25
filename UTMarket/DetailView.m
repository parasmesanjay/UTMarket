//
//  DetailView.m
//  UTMarket
//
//  Created by Ashish sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import "DetailView.h"

@implementation DetailView

- (void)drawRect:(CGRect)rect {

    _imgProfile.layer.cornerRadius = 40;
    _imgProfile.clipsToBounds = YES;
}


@end
