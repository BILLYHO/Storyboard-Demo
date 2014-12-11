//
//  PlayersTableViewController.h
//  Rating
//
//  Created by BILLY HO on 12/10/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"

@interface PlayersTableViewController : UITableViewController <PlayerDetailsViewControllerDelegate>
@property (nonatomic, strong) NSMutableArray *players;

@end
