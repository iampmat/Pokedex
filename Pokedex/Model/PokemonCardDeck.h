//
//  PokemonCardDeck.h
//  Pokedex
//
//  Created by Patrick Matherly on 6/3/15.
//  Copyright (c) 2015 Patrick Matherly. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PokemonCard.h"

@interface PokemonCardDeck : NSObject

- (void)addCard:(PokemonCard *)card atTop:(BOOL)atTop;
- (void)addCard:(PokemonCard *)card;

- (PokemonCard *)drawRandomCard;
- (PokemonCard *)currentCard;
- (PokemonCard *)nextCard;
- (PokemonCard *)prevCard;

@end
