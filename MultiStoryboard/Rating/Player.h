//
//  Player.h
//  Rating
//
//  Created by BILLY HO on 12/10/14.
//  Copyright (c) 2014 BILLY HO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) NSInteger rating;

@end
