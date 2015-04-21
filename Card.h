//
//  Card.h
//  Matchismo
//
//  Created by David Herrera on 2015-03-29.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//
#import <Foundation/Foundation.h>


@interface Card:NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;

@property (nonatomic, getter=isMatched) BOOL matched;
-(int)match:(NSArray *)card;
@end