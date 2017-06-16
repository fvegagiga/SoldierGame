//
//  Weapon.h
//  SoldierGame
//
//  Created by cice on 15/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAttackable.h"

@class Soldier;

@interface Weapon : NSObject <IAttackable>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int damage;
@property (nonatomic, weak) Soldier *owner;

// Constructor de conveniencia
+(id)weaponWithName:(NSString*)name
         withDamage:(int)damage;

// Constructores
-(id)initWithName:(NSString*)name
       withDamage:(int)damage
        withOwner:(Soldier *) owner;

// Métodos
//-(BOOL)attack:(Soldier *) target;

@end
