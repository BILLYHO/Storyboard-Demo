//
//  PlayerDetailsViewController.h
//  Rating
//
//  Created by BILLY HO on 12/11/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePickerViewController.h"

@class PlayerDetailsViewController;
@class Player;

@protocol PlayerDetailsViewControllerDelegate <NSObject>
- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller;
- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player;@end

@interface PlayerDetailsViewController : UITableViewController <GamePickerViewControllerDelegate>

@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
