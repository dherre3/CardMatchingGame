//
//  Deck.h
//  Matchismo
//
//  Created by David Herrera on 2015-03-31.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck: NSObject


-(void)addCard:(Card *) card atTop:(BOOL)atTop;
-(void)addCard:(Card *) card;

-(Card *)drawRandomCard;


@end
