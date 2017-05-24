//
//  DetailView.h
//  UTMarket
//
//  Created by Ashish sharma on 24/05/17.
//  Copyright © 2017 Ashish sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DetailView : UIView
@property (strong, nonatomic) IBOutlet UIScrollView *scrollSlieder;

@property (strong, nonatomic) IBOutlet UIImageView *imgProfile;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblDetail;
@property (strong, nonatomic) IBOutlet UILabel *lblMobile;

@property (strong, nonatomic) IBOutlet UIImageView *img_icon;
@property (strong, nonatomic) IBOutlet UIImageView *img_icon_1;
@property (strong, nonatomic) IBOutlet UIImageView *img_icon_2;

@property (strong, nonatomic) IBOutlet UILabel *lblProfileName;

@property (strong, nonatomic) IBOutlet UITextView *textDetail;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UILabel *btnGiveReview;

@property (strong, nonatomic) IBOutlet UIButton *btnSeeAllReviews;

@property (strong, nonatomic) IBOutlet UILabel *lblReadReviewCount;

@end
