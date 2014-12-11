//
//  PlayerCell.h
//  Rating
//
//  Created by BILLY HO on 12/10/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *gameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *ratingImageView;

@end
