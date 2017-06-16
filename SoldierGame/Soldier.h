//
//  Soldier.h
//  SoldierGame
//
//  Created by cice on 14/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAttackable.h"

@class Weapon;

@interface Soldier : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) int life;
@property (nonatomic, strong) id<IAttackable> weapon;
@property (nonatomic, assign, readonly) int cura;

// Constructores
-(id)init;
-(id)initWithName:(NSString*)name;
-(id)initWithName:(NSString*)name
               withLife:(int)life
          withPrecision:(int)precision
             withDamage:(int)damage;
-(id)initWithName:(NSString*)name
     withMedicine:(int)cura;

+(int)totalSoldiers;

// Métodos
-(void)attack:(Soldier*)target;
-(void)cure:(Soldier*)target;

@end
