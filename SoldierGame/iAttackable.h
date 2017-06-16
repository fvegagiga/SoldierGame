//
//  iAttackable.h
//  SoldierGame
//
//  Created by cice on 16/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

@class Soldier;

@protocol IAttackable <NSObject>

@required

@optional

@property (nonatomic, weak) Soldier *owner;

-(BOOL)attack:(Soldier *)target;

@end
