//
//  Soldier+Internal.h
//  SoldierGame
//
//  Created by cice on 16/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import "Soldier.h"

@interface Soldier (Internal)

-(void)receiveAttackFrom:(Soldier*)attacker
              withDamage:(int)damage;

@end
