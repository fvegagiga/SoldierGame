//
//  Soldier.m
//  SoldierGame
//
//  Created by cice on 14/6/17.
//  Copyright © 2017 Cice. All rights reserved.
//

#import "Soldier.h"
#import "Weapon.h"



// esto es una extensión, la categoría sin nombre se especifica con los parentesis ()
@interface Soldier()

    @property (nonatomic, assign, readonly) int damage;
    @property (nonatomic, assign, readonly) int precision;

@end



@implementation Soldier

static int nSoldiers = 0;


+(int)totalSoldiers{
    return nSoldiers;
}

// Sobreescribimos el metodo "setWeapon" que se crea por defecto
-(void)setWeapon:(Weapon *)weapon
{
    _weapon = weapon;
    _weapon.owner = self;
}


// Constructores --------------------

-(Soldier *)init{
    self = [super init];
    if(self){
        _name = @"Unknown";
        _life = 100;
    }
    return self;
}

-(Soldier *)initWithName:(NSString *)name{
    self = [self init];
    if(self){
        
        nSoldiers ++;
        
        _name = name;
        _life = 100;
        _damage = 100;
    }
    return self;
}

-(Soldier *)initWithName:(NSString *)name
                withLife:(int)life
           withPrecision:(int)precision
              withDamage:(int)damage {
    //self = [super init];
    self = [self initWithName:name];
    if(self){
        //_name = name;
        _life = life;
        _precision = precision;
        _damage = damage;
        _cura = 0;
    }
    return self;
}

-(Soldier *)initWithName:(NSString *)name
            withMedicine:(int)cura {
    //self = [super init];
    self = [self initWithName:name];
    if(self){
        _cura = cura;
    }
    return self;
}

-(void)attack:(Soldier *)target {
    NSLog(@"%@ dice: Voy a atacar a %@", self.name, target.name);
    
    int randomPrecision = arc4random_uniform(100);
    
    if(randomPrecision < self.precision){
        
        [self.weapon attack:target];
        
        //[target receiveAttackFrom:self withDamage:self.damage];
        
    } else {
        NSLog(@"%@ dice: ¡Mierda, he fallado!", self.name);
        NSLog(@"\n");
    }
}

-(void)receiveAttackFrom:(Soldier *)attacker
              withDamage:(int)damage {
    
    _life -= damage;
    
    if(self.life > 0){
        NSLog(@"%@ dice: He recibido un ataque de %@ con %d de daño, y me queda %d de vida", self.name, attacker.name, damage, self.life);
    } else {
        NSLog(@"%@ dice: Argggg!!!! %@ me ha matado!", self.name, attacker.name);
        NSLog(@"\n");
    }
}

-(void)cure:(Soldier *)target {
    NSLog(@"%@ dice: %@ te han herido", self.name, target.name);
    
    int randomSalud = arc4random_uniform(2);
    
    if(randomSalud == 1){
        [target receiveCuraFrom:self
                   withMedicine:self.cura];
    } else {
        NSLog(@"%@ dice: No te voy a curar. %@, continua la batalla!!!", self.name, target.name);
        NSLog(@"\n");
    }
}



-(void)receiveCuraFrom:(Soldier *)doctor
          withMedicine:(int)cura {
    
    _life += cura;
    
    if(self.life > 0){
        NSLog(@"%@ dice: Bien! Me han curado. He recibido una cura del %@ con %d de salud, y me queda %d de vida", self.name, doctor.name, cura, self.life);
    }
//    else {
//        NSLog(@"%@ dice: Argggg!!!! %@ me ha matado!", self.name, doctor.name);
//    }
    NSLog(@"\n");
}

@end
