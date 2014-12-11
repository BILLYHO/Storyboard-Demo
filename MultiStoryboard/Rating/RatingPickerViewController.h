//
//  RatingPickerViewController.h
//  Rating
//
//  Created by BILLY HO on 12/11/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RatingPickerViewController;
@protocol RatingPickerViewControllerDelegate <NSObject>
- (void)ratingPickerViewController:(RatingPickerViewController *)controller didSelectRating:(NSInteger)rating;
@end

@interface RatingPickerViewController : UITableViewController

@property (weak, nonatomic) id<RatingPickerViewControllerDelegate> delegate;

@property (nonatomic) NSInteger rating;

@end
