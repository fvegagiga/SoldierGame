//
//  Pet.h
//  SoldierGame
//
//  Created by cice on 16/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IAttackable.h"

@interface Pet : NSObject <IAttackable>

@property (nonatomic, weak) Soldier *owner;


@end
