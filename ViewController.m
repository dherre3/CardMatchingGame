//
//  ViewController.m
//  Matchismo
//
//  Created by David Herrera on 2015-02-25.
//  Copyright (c) 2015 David Herrera. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gamePlayLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic,strong) Deck* deck;
@property (weak, nonatomic) IBOutlet UISwitch *gameModeSwitch;

@property (nonatomic, strong) CardMatchingGame *game;
@end



@implementation ViewController


- (IBAction)touchResetButton:(id)sender {

        _game=nil;
        [self updateUI];
        self.scoreLabel.text=@"Score: 0";
        self.gamePlayLabel.text=@"Game Log";
        _gameModeSwitch.enabled=YES;
    
    
    
    
    
    
}

-(Deck *)createDeck{
    
    return [[PlayingCardDeck alloc] init];
}
-(CardMatchingGame *)game
{
    if(!_game) {
        _game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                usingDeck:[self createDeck]];
    }
    return _game;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex=(int)[self.cardButtons indexOfObject:sender];
    if([_gameModeSwitch isOn]){
        [self.game chooseCardAtIndex:chosenButtonIndex];
    }else{
        [self.game chooseCardAtIndexThreeCardMode:chosenButtonIndex];
    }
    [self updateUI];
    _gameModeSwitch.enabled=NO;
    
}
-(NSString *)gamePlayDescrition
{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex=(int)[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        Card *firstCard;
        Card *secondCard;
        int count=0;
        if(card.chosen){
            count++;
            if(count==1){
                 firstCard=card;
            }else if(count ==2){
                secondCard=card;
            }
        }
        
    }
    return nil;
}
-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
         int cardButtonIndex=(int)[self.cardButtons indexOfObject:cardButton];
         Card *card=[self.game cardAtIndex:cardButtonIndex];
        NSLog(@"%@",card.contents);
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.isMatched;
        
    }
    self.gamePlayLabel.text=self.game.gameDescription;
    self.scoreLabel.text    = [NSString stringWithFormat:@"Score: %ld", self.game.score];
}
-(NSString *) titleForCard:(Card *) card
{
    return card.isChosen ? card.contents:@"";
    
}
-(UIImage *) backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
