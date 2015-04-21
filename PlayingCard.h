//
//  PlayingCard.h
//  Matchismo
//
//  Created by David Herrera on 2015-03-31.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface PlayingCard: Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;
+(NSArray *) validSuits;
+(NSUInteger) maxRank;
+(NSArray *) rankStrings;

@end
