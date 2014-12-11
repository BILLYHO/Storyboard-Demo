//
//  RatingPickerViewController.m
//  Rating
//
//  Created by BILLY HO on 12/11/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import "RatingPickerViewController.h"
#import "RatingCell.h"

@interface RatingPickerViewController ()

@end

@implementation RatingPickerViewController
{
	NSUInteger _selectedIndex;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	_selectedIndex = _rating - 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	RatingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RatingCell"];
	cell.ratingImageView.image = [self imageForIndex:indexPath.row];
	cell.ratingImageView.contentMode = UIViewContentModeLeft;
	if (indexPath.row == _selectedIndex) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	return cell;
}

- (UIImage *)imageForIndex:(NSInteger)rating
{
	switch (rating) {
		case 0: return [UIImage imageNamed:@"1Star"];
		case 1: return [UIImage imageNamed:@"2Stars"];
		case 2: return [UIImage imageNamed:@"3Stars"];
		case 3: return [UIImage imageNamed:@"4Stars"];
		case 4: return [UIImage imageNamed:@"5Stars"];
	}
	return nil;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
 
	if (_selectedIndex != NSNotFound) {
		UITableViewCell *cell = [tableView cellForRowAtIndexPath:
								 [NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
 
	_selectedIndex = indexPath.row;
 
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
 
	_rating = _selectedIndex + 1;
	[self.delegate ratingPickerViewController:self didSelectRating:_rating];
}



@end
