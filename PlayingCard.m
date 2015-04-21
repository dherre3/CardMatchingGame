//
//  PlayingCard.m
//  Matchismo
//
//  Created by David Herrera on 2015-03-31.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//


#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSArray *) otherCards
{
    int score =0;
    if([otherCards count]==1){
        PlayingCard *otherCard=[otherCards firstObject];
        if([self.suit isEqualToString:otherCard.suit ]){
            score=1;
        }else if(self.rank==[otherCard rank]){
            score=4;
        }
    }else{
        PlayingCard *firstChosenCard=otherCards[0];
        PlayingCard *secondChosenCard=otherCards[1];
        if(self.rank==((PlayingCard *)otherCards[0]).rank&&self.rank==((PlayingCard *)otherCards[1]).rank){
            score=16;
        }else if(firstChosenCard.rank==secondChosenCard.rank||firstChosenCard.rank==self.rank||self.rank==secondChosenCard.rank) {
            score=4;
            
        }
        else if([firstChosenCard.suit isEqualToString:secondChosenCard.suit]&&[self.suit isEqualToString:secondChosenCard.suit]){
            score=4;
        }
        else if([firstChosenCard.suit isEqualToString:secondChosenCard.suit]||[firstChosenCard.suit isEqualToString:self.suit]||[self.suit isEqualToString:secondChosenCard.suit]){
            score=1;
        }
        
    }
    return score;
}

-(NSString *)contents
{
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
@synthesize suit=_suit;//Because setter and getter provided
//Protecting the suit from malform suits

+(NSArray *) validSuits
{
    return @[@"♥️",@"♦️",@"♣️",@"♠️"] ;
}
-(void)setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
}
+(NSArray *) rankStrings
{
        return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger) maxRank{return [[self rankStrings] count] -1;}

-(NSString *)suit
{
    return _suit ?_suit:@"?";
}

-(void) setRank:(NSUInteger)rank
{
    if(rank<=[PlayingCard maxRank])
    {
        _rank=rank;
    }
}
@end