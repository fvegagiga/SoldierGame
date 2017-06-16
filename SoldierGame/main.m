//
//  main.m
//  SoldierGame
//
//  Created by cice on 14/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Soldier.h"
#import "MeleWeapon.h"
#import "FireWeapon.h"
#import "Pet.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *soldiersNames = [[NSArray alloc] initWithObjects:@"Peter", @"Jonas", @"John", @"Harry", @"Luke", nil];
        // nil marca el final del array
        // otras formas de inicializar un array
        //NSArray *soldiernames2 = [NSArray arrayWithObjects:@"Peter", @"Jonas", nil]
        //NSArray *soldierNames3 = @[ @"Peter", @"Jonas"];

        NSArray *meleWeaponNames = [NSArray arrayWithObjects:@"espada", @"sable", @"cuchillo", @"uñas", @"katana", nil];
        NSArray *fireWeaponNames = @[ @"pistola", @"ametralladora", @"cañon", @"escopeta"];
        
        NSDictionary *weaponsDamage = @{
                                        @"katana" : @12,
                                        @"cuchillo" : @3,
                                        @"espada" : @7,
                                        @"sable" : @10,
                                        @"uñas" : @1,
                                        @"pistola" : @15,
                                        @"ametralladora" : @25,
                                        @"cañon" : @35,
                                        @"escopeta" : @20 };
        // Otros métodos de inicializa un diccionario
        //NSDictionary *weaponsDamage = [[NSDictionary alloc] initWithObjectsAndKeys:@12,@"katana", @3, @"cuchicllo", nil]];
        
        NSMutableArray *allWeapons = [NSMutableArray array];
        
        for (NSString *weaponName in meleWeaponNames) {
            
            NSNumber *damage = weaponsDamage[weaponName];
            
//            MeleWeapon *meleWeapon = [[MeleWeapon alloc] initWithName:weaponName
//                                                           withDamage:damage.intValue
//                                                            withOwner:nil];
            MeleWeapon *meleWeapon = [MeleWeapon weaponWithName:weaponName withDamage:damage.intValue];
            
            [allWeapons addObject:meleWeapon];
        }
        
        
        for (NSString *weaponName in fireWeaponNames) {
            
            NSNumber *damage = weaponsDamage[weaponName];

            FireWeapon *fireWeapon = [[FireWeapon alloc] initWithName:weaponName
                                                       withDamage:damage.intValue
                                                        withOwner:nil];
            [allWeapons addObject:fireWeapon];
        }
        
        [allWeapons addObject:[[Pet alloc] init]];
        
        NSMutableArray *soldiers = [NSMutableArray array];

        Soldier *doctorSoldier = [[Soldier alloc] initWithName:@"Doctor"
                                                  withMedicine:10];
        
        for (NSString *name in soldiersNames) {
            
            int randomLife = 70 + arc4random_uniform(60);
            int randomPrecision = 40 + arc4random_uniform(50);
            int randomDamage = 6 + arc4random_uniform(6);
            
            Soldier *newSoldier = [[Soldier alloc] initWithName:name
                                                       withLife:randomLife
                                                  withPrecision:randomPrecision
                                                     withDamage:randomDamage];
            
            int randomWeaponIndex = arc4random_uniform((uint)allWeapons.count);
            
            //id<IAttackable>
            id randomWeapon = allWeapons[randomWeaponIndex];
            
            newSoldier.weapon = randomWeapon;
            
            [allWeapons removeObject:randomWeapon];
            
            [soldiers addObject:newSoldier];
        }

        NSLog(@"Van a luchar %d soldados", [Soldier totalSoldiers]);
        
        while ([soldiers count] > 1){
            
            int randomAttackerIndex = arc4random_uniform((uint)[soldiers count]);
            int randomReceiverIndex = randomAttackerIndex;
            
            while(randomReceiverIndex == randomAttackerIndex){
                randomReceiverIndex = arc4random_uniform((uint)[soldiers count]);
            }
            
            Soldier *attackingSoldier = soldiers[randomAttackerIndex];
            Soldier *targetSoldier = [soldiers objectAtIndex:randomReceiverIndex];

            int saludPrevia = targetSoldier.life;

            [attackingSoldier attack:targetSoldier];
            
            if (targetSoldier.life <= 0){
                [soldiers removeObject:targetSoldier];
            } else {
                if (saludPrevia > targetSoldier.life)
                    [doctorSoldier cure:targetSoldier];
            }
        }
        
        id winner = soldiers[0];
        NSLog(@"¡%@ ha ganado!", [winner name]);
        
//        Soldier *winner = soldiers[0];
//        NSLog(@"¡%@ ha ganado!", winner.name);
        
        //NSLog(@"¡%@ ha ganado!", [soldiers[0] name]);

    }
    
    return 0;
}

void imprimirMensaje(NSString *mensaje){
    NSLog(@"%@", mensaje);
}
