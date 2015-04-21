//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by David Herrera on 2015-04-19.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame: NSObject

//designated initializer!!!, you have to call your super designated initializer from your designated initializer!!!!! 
-(instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(void)chooseCardAtIndexThreeCardMode:(NSUInteger)index;
-(Card *) cardAtIndex:(NSUInteger)index;
//Notice the read only score property that stands for the fact that we do no want the user or anyone else outside the game to change the score
@property (nonatomic, readonly)NSInteger score;
@property (nonatomic, readonly)NSString *gameDescription;

@end
