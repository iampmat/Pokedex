//
//  PokemonCard.h
//  Pokedex
//
//  Created by Patrick Matherly on 6/3/15.
//  Copyright (c) 2015 Patrick Matherly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokemonCard : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *type;
@property (nonatomic) int HP;

@end
