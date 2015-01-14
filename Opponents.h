//
//  Opponents.h
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "GameObject.h"
#import "GameCharacter.h"
#import "Players.h"
#import "SneakyJoystick.h"
#import "Constants.h"
#import "CommonProtocols.h"
#import "BackgroundImage.h"
#import "Players.h"

@interface Opponents : GameObject
{
    GameCharacter *players[3];
    
    CCAnimation *MF1;

    CCAnimation *MB1;

    CCAnimation *ML1;

    CCAnimation *MR1;

    CCAnimation *MLD1;

    CCAnimation *MRD1;

    CCAnimation *MBLD1;

    CCAnimation *MBRD1;
    
    GameCharacter *background;
    
    SneakyJoystick *joystick;
    
    
    int check;

}

@property(nonatomic,assign) SneakyJoystick *joystick;
@property(nonatomic,retain) GameCharacter *background;
@property(nonatomic,retain) CCAnimation *ML1;
@property(nonatomic,retain) CCAnimation *MF1;
@property(nonatomic,retain) CCAnimation *MB1;
@property(nonatomic,retain) CCAnimation *MR1;
@property(nonatomic,retain) CCAnimation *MLD1;
@property(nonatomic,retain) CCAnimation *MRD1;
@property(nonatomic,retain) CCAnimation *MBLD1;
@property(nonatomic,retain) CCAnimation *MBRD1;


@end
