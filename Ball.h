//
//  Ball.h
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "GameObject.h"
#import "SneakyButton.h"
#import "SneakyJoystick.h"
#import "GameCharacter.h"
#import "Players.h"

@interface Ball : GameObject
{
    SneakyButton *passButton;
    SneakyButton *passButton2;
    GameCharacter *ourPlayer1;
    GameCharacter *ourPlayer2;
    GameCharacter *ourPlayer3;
    GameCharacter *playerArray[3];
    CCSprite *pointer;
}

@property(nonatomic, assign)SneakyButton *passButton;
@property(nonatomic, assign)SneakyButton *passButton2;



@end
