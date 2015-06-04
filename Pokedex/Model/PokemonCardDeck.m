//
//  PokemonCardDeck.m
//  Pokedex
//
//  Created by Patrick Matherly on 6/3/15.
//  Copyright (c) 2015 Patrick Matherly. All rights reserved.
//

#import "PokemonCardDeck.h"
#import "PokemonCard.h"

@interface PokemonCardDeck()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic) int count;
@end

@implementation PokemonCardDeck

- (instancetype)init
{
    self = [super init];
    
    //Set deck counter to 0
    _count = 0;
    
    if (self) {
        for (NSUInteger i = 0; i < 4; i++) {
            PokemonCard *card = [[PokemonCard alloc] init];
            card.name = [@[@"pikachu",@"charmander",@"bulbasaur",@"squirtle"] objectAtIndex:i];
            [self addCard:card];
        }
    }
    return self;
}

- (NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(PokemonCard *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(PokemonCard *)card
{
    [self addCard:card atTop:NO];
}

- (PokemonCard *)drawRandomCard
{
    PokemonCard *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        return randomCard;
    }
    
    return randomCard;
}

- (PokemonCard *)currentCard
{
    unsigned index = _count % [self.cards count];
    return self.cards[index];
}

- (PokemonCard *)nextCard
{
    PokemonCard *nextCard = nil;
    unsigned index = ++_count % [self.cards count];
    nextCard = self.cards[index];
    
    return nextCard;
}

- (PokemonCard *)prevCard
{
    PokemonCard *prevCard = nil;
    unsigned index = --_count % [self.cards count];
    prevCard = self.cards[index];
    
    return prevCard;
}


@end
