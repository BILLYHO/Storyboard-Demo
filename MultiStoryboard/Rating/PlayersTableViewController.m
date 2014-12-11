//
//  PlayersTableViewController.m
//  Rating
//
//  Created by BILLY HO on 12/10/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "PlayersTableViewController.h"
#import "Player.h"
#import "PlayerCell.h"

@interface PlayersTableViewController ()

@end

@implementation PlayersTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.players count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	PlayerCell *cell = (PlayerCell *)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
 
	Player *player = (self.players)[indexPath.row];
	cell.nameLabel.text = player.name;
	cell.gameLabel.text = player.game;
	cell.ratingImageView.image = [self imageForRating:player.rating];
 
	return cell;
}

- (UIImage *)imageForRating:(NSInteger)rating
{
	switch (rating) {
		case 1: return [UIImage imageNamed:@"1StarSmall"];
		case 2: return [UIImage imageNamed:@"2StarsSmall"];
		case 3: return [UIImage imageNamed:@"3StarsSmall"];
		case 4: return [UIImage imageNamed:@"4StarsSmall"];
		case 5: return [UIImage imageNamed:@"5StarsSmall"];
	}
	return nil;
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player
{
	[self.players addObject:player];
	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count] - 1) inSection:0];
	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addRating:(id)sender
{
	UIStoryboard *addRatingStoryboard = [UIStoryboard storyboardWithName:@"AddRating" bundle:nil];
	UINavigationController *nav = [addRatingStoryboard instantiateInitialViewController];
	PlayerDetailsViewController *playerDetailsViewController = [nav viewControllers][0];
	playerDetailsViewController.delegate = self;
	[self presentViewController:nav animated:YES completion:nil];
}


@end
