//
//  FireWeapon.m
//  SoldierGame
//
//  Created by cice on 15/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import "FireWeapon.h"
#import "Soldier.h"
#import "Soldier+Internal.h"


@implementation FireWeapon

+(id)weaponWithName:(NSString *)name withDamage:(int)damage
{
    return [[FireWeapon alloc] initWithName:name withDamage:damage withOwner:nil];
}

-(BOOL)attack:(Soldier *)target {
    NSLog(@"%@ dice: Atacando a distancia con %@ a %@", self.owner.name, self.name, target.name);
    
    [target receiveAttackFrom:self.owner withDamage:self.damage];
    
    return true;
}

@end
