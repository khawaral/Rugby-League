//
//  BackgroundImage.h
//  RugbyLeague
//
//  Created by khawar ali on 1/12/13.
//
//

#import "GameObject.h"
#import "SneakyButton.h"
#import "SneakyJoystick.h"
#import "GameCharacter.h"
#import "Players.h"
@interface BackgroundImage : GameObject
{
    //BOOL gameHasStarted;
    SneakyJoystick *joystick;
    SneakyButton *passButton ;
    GameCharacter *ourPlayer1;
    GameCharacter *ourPlayer2;
    GameCharacter *ourPlayer3;
    int forCheckingTheStates;

}

@property (nonatomic,assign) SneakyJoystick *joystick;
@property (nonatomic,assign) SneakyButton *passButton;
//@property(nonatomic,assign) BOOL gameHasStarted;
@end
