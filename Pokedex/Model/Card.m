//
//  Card.m
//  Pokedex
//
//  Created by Patrick Matherly on 6/3/15.
//  Copyright (c) 2015 Patrick Matherly. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSString *)otherCards
{
    int score = 0;
    
    for (Card *cards in otherCards) {
        if ([cards.name isEqualToString:self.name]) {
            int score = 1;
        }
    }
    
    return score;
}

@end
