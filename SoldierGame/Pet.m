//
//  Pet.m
//  SoldierGame
//
//  Created by cice on 16/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import "Pet.h"
#import "Soldier.h"
#import "Soldier+Internal.h"


@implementation Pet

-(BOOL)attack:(Soldier *)target
{
    NSLog(@"%@ dice: Pikach, lanza tu impactrueno", self.owner.name);
    [target receiveAttackFrom:self.owner withDamage:arc4random_uniform(100)];
    
    return true;
}

@end
