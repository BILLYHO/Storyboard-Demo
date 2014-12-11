//
//  PlayerDetailsViewController.m
//  Rating
//
//  Created by BILLY HO on 12/11/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "Player.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
	NSString *_game;
	int _rating;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder])) {
		NSLog(@"init PlayerDetailsViewController");
		_game = @"Chess";
		_rating = 5;
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"dealloc PlayerDetailsViewController");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailLabel.text = _game;
	self.ratingImageView.image = [self imageForRating:_rating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0) {
		[self.nameTextField becomeFirstResponder];
	}
}

#pragma Button action
- (IBAction)done:(id)sender
{
	Player *player = [[Player alloc] init];
	player.name = self.nameTextField.text;
	player.game = _game;
	player.rating = _rating;
	[self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (IBAction)cancel:(id)sender
{
	[self.delegate playerDetailsViewControllerDidCancel:self];
}

#pragma segue action
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"PickGame"])
	{
		GamePickerViewController *gamePickerViewController = segue.destinationViewController;
		gamePickerViewController.delegate = self;
		gamePickerViewController.game = _game;
	}
	else if ([segue.identifier isEqualToString:@"PickRating"])
	{
		RatingPickerViewController *ratingPickerViewController = segue.destinationViewController;
		ratingPickerViewController.delegate = self;
		ratingPickerViewController.rating = _rating;
	}
}

#pragma GamePickerViewControllerDelegate
- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game
{
	_game = game;
	self.detailLabel.text = _game;
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma RatingPickerViewControllerDelegate
- (void)ratingPickerViewController:(RatingPickerViewController *)controller didSelectRating:(NSInteger)rating
{
	_rating = (int)rating;
	self.ratingImageView.image = [self imageForRating:_rating];
	[self.navigationController popToRootViewControllerAnimated:YES];
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

@end
