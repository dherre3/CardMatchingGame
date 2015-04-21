//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by David Herrera on 2015-04-19.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property(nonatomic, strong) NSMutableArray *cards; //of Card
@property(nonatomic, readwrite) NSString *gameDescription;
@end
//notice how we specified readwrite, this is the only time when we want the user to have a different access than the host
@implementation CardMatchingGame

-(NSMutableArray *) cards{
    if(!_cards) _cards=[[NSMutableArray alloc] init];
    return _cards;
}


-(instancetype) initWithCardCount:(NSUInteger) count
                    usingDeck:(Deck *)deck
{
   
    self=[super init];
    if(self){
        for(int i=0;i<count;i++){
            Card *card=[deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
        }
    }
    return self;
}
-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index]:nil;
}
static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS=4;
static const int COST_TO_CHOOSE=1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card=[self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
           card.chosen=NO;
        }else{
            self.gameDescription=[NSString stringWithFormat:@"%@", card.contents];
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore=[card match:@[otherCard]];
                if(matchScore){
                    self.score+=matchScore*MATCH_BONUS;
                    card.matched=YES;
                    otherCard.matched=YES;
                    self.gameDescription=[NSString stringWithFormat:@"Matched %@, %@ for %d points.", card.contents, otherCard.contents, matchScore*MATCH_BONUS];
                }else{
                    self.score -=MISMATCH_PENALTY;
                    otherCard.chosen=NO;
                    self.gameDescription=[NSString stringWithFormat:@"%@ %@ do not match!. Penalty of %d", card.contents, otherCard.contents, MISMATCH_PENALTY];
                }
                 break;
            }
           
        }
        card.chosen=YES;
        self.score-=COST_TO_CHOOSE;
        }
    }
}
-(void)chooseCardAtIndexThreeCardMode:(NSUInteger)index
{
    
    Card *card=[self cardAtIndex:index];
    Card *cardSecond;
    Card *cardThird;
    int numberOfChosenCards=1;
    NSMutableArray *chosenCardArray=[[NSMutableArray alloc]init];
    [chosenCardArray addObject:card];
    self.gameDescription=[NSString stringWithFormat:@"%@", card.contents];
    if(card.isChosen){
        card.chosen=NO;
    }else{
        for(Card *otherCard in self.cards){
            if(otherCard.isChosen && !otherCard.isMatched){
                numberOfChosenCards++;
                if(numberOfChosenCards==3){
                    cardThird=otherCard;
                    int matchScore=[card match:@[cardSecond,cardThird]];
                    if(matchScore){
                        self.score+=matchScore*MATCH_BONUS;
                        cardThird.matched=YES;
                        cardSecond.matched=YES;
                        card.matched=YES;
                          self.gameDescription=[NSString stringWithFormat:@"Matched %@, %@, %@ for %d points", card.contents, cardThird.contents,cardSecond.contents, matchScore*MATCH_BONUS];
                    }else{
                        self.score-=MISMATCH_PENALTY*2;
                        card.chosen=YES;
                        cardThird.chosen=NO;
                        cardSecond.chosen=NO;
                        self.gameDescription=[NSString stringWithFormat:@"%@ %@ %@ do not match!. Penalty of %d points", card.contents, cardThird.contents,cardSecond.contents, MISMATCH_PENALTY];
                        
                    }
                    break;
                }else{
                    cardSecond=otherCard;
                }
            }
        }
        if([chosenCardArray count]==3){
        }else{
            card.chosen=YES;
        }
        self.score-=COST_TO_CHOOSE*3;
    }
}

- (instancetype) init
{
    return nil;
}



@end