//
//  ViewController.m
//  Pokedex
//
//  Created by Patrick Matherly on 6/3/15.
//  Copyright (c) 2015 Patrick Matherly. All rights reserved.
//

#import "ViewController.h"
#import "PokemonCardDeck.h"

@interface ViewController ()
@property (strong, nonatomic)PokemonCardDeck *deck;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (strong, nonatomic)PokemonCard *currentCard;
@end

@implementation ViewController

- (void)viewDidLoad
{
    //Adding swipe gestures
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    //Initialize pokemon deck
    _deck = [[PokemonCardDeck alloc]init];
    
    //Set up first card
    _currentCard = _deck.currentCard;
    [_cardButton setBackgroundImage:[UIImage imageNamed:_currentCard.name]
                      forState:UIControlStateNormal];
    [super viewDidLoad];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    if (![sender.currentBackgroundImage isEqual:[UIImage imageNamed:@"cardback"]]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:_currentCard.name]
                          forState:UIControlStateNormal];
    }
}

-(void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if ([_cardButton.currentBackgroundImage isEqual:[UIImage imageNamed:@"cardback"]]) {
        _currentCard = _deck.nextCard;
    } else {
        _currentCard = _deck.nextCard;
        [_cardButton setBackgroundImage:[UIImage imageNamed:_currentCard.name] forState:UIControlStateNormal];
    }
}

-(void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if ([_cardButton.currentBackgroundImage isEqual:[UIImage imageNamed:@"cardback"]]) {
        _currentCard = _deck.prevCard;
    } else {
        _currentCard = _deck.prevCard;
        [_cardButton setBackgroundImage:[UIImage imageNamed:_currentCard.name] forState:UIControlStateNormal];
    }
}

@end
