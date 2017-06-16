//
//  Weapon.m
//  SoldierGame
//
//  Created by cice on 15/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import "Weapon.h"
#import "Soldier.h"

@implementation Weapon

+(id)weaponWithName:(NSString *)name withDamage:(int)damage
{
    return nil;
}

-(id)initWithName:(NSString *)name
       withDamage:(int)damage
        withOwner:(Soldier *) owner {
    self = [super init];
    if (self) {
        _name = name;
        _damage = damage;
        _owner = owner;
    }
    return self;
}


//-(BOOL)attack:(Soldier *)target {
//    NSLog(@"ERROR: Este arma es genérica, usar tipos de armas concretas");
//    
//    return false;
//}

@end
