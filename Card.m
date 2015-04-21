//
//  Card.m
//  Matchismo
//
//  Created by David Herrera on 2015-03-29.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//
		
#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize contents=_contents;
@synthesize matched=_matched;
@synthesize chosen=_chosen;
-(NSString *)contents
{
    return _contents;
}
-(void)setContents:(NSString *)contents
{
    _contents=contents;
}

-(BOOL) isMatched
{
    return _matched;
}
-(BOOL) isChosen
{
    return _chosen;
}
-(void) setChosen:(BOOL)chosen
{
    _chosen=chosen;
}
-(void) setMatched:(BOOL)matched
{
    _matched=matched;
}

-(int)match:(NSArray *)otherCards
{
    int score =0;
    for(Card *card in otherCards)
    {
        if([card.contents isEqualToString:self.contents])
        {
            score=1;
        }
    }
    return score;
}
@end
