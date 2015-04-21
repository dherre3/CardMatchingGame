//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by David Herrera on 2015-04-13.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


-(instancetype) init
{
    self=[super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank=1;rank<=[PlayingCard maxRank];rank++){
                PlayingCard *card=[[PlayingCard alloc] init];
                card.rank=rank;
                card.suit=suit;
                [self addCard:card];
                
            }
            
        }
    }
    return self;
}


@end