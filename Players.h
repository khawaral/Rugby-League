//
//  Players.h
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "GameCharacter.h"
#import "SneakyButton.h"
#import "SneakyJoystick.h"
#import "Ball.h"
#import "Opponents.h"
#import "GameManager.h"

@interface Players : GameCharacter
{
    //BOOL gameHasStarted;
    SneakyJoystick *joystick;
    SneakyButton *passButton ;
    SneakyButton *passButton2;
    float milliSecondsStayingReceving;
    float milliSecondsStayingCelebrating;
    float milliSecondsStayingFallingDown;
    float everythingHasEnded;
    
    BOOL everythingFinished;
    
    CCAnimation *MF1;
    CCAnimation *MF2;
    CCAnimation *MF3;
    CCAnimation *MB1;
    CCAnimation *MB2;
    CCAnimation *MB3;
    CCAnimation *ML1;
    CCAnimation *ML2;
    CCAnimation *ML3;
    CCAnimation *MR1;
    CCAnimation *MR2;
    CCAnimation *MR3;
    CCAnimation *MLD1;
    CCAnimation *MLD2;
    CCAnimation *MLD3;
    CCAnimation *MRD1;
    CCAnimation *MRD2;
    CCAnimation *MRD3;
    CCAnimation *MBLD1;
    CCAnimation *MBLD2;
    CCAnimation *MBLD3;
    CCAnimation *MBRD1;
    CCAnimation *MBRD2;
    CCAnimation *MBRD3;
    CCAnimation *MC1;
    CCAnimation *MC2;
    CCAnimation *MC3;

    float value;
    
    GameCharacter *background;
    GameCharacter *playerHavingBallRightNow;
    
    int relativeLocation;
    int desiredPosition;
    
    CCSprite *pointer;
    //CCSprite *pointer2;
    int pointerAdded;
}

@property(readwrite)int relativeLocation;
@property(readwrite)int desiredPosition;


@property (nonatomic,retain)GameCharacter *playerHavingBallRightNow;
@property(nonatomic,retain)GameCharacter *background;

@property (nonatomic,assign) SneakyJoystick *joystick;
@property (nonatomic,assign) SneakyButton *passButton;
@property (nonatomic,assign) SneakyButton *passButton2;
//@property(nonatomic,assign) BOOL gameHasStarted;


@property(nonatomic,retain) CCAnimation *MC1;
@property(nonatomic,retain) CCAnimation *MC2;
@property(nonatomic,retain) CCAnimation *MC3;


@property(nonatomic,retain) CCAnimation *ML1;
@property(nonatomic,retain) CCAnimation *MR1;
@property(nonatomic,retain) CCAnimation *MLD1;
@property(nonatomic,retain) CCAnimation *MRD1;
@property(nonatomic,retain) CCAnimation *MBLD1;
@property(nonatomic,retain) CCAnimation *MBRD1;

@property(nonatomic,retain) CCAnimation *ML2;
@property(nonatomic,retain) CCAnimation *MR2;
@property(nonatomic,retain) CCAnimation *MLD2;
@property(nonatomic,retain) CCAnimation *MRD2;
@property(nonatomic,retain) CCAnimation *MBLD2;
@property(nonatomic,retain) CCAnimation *MBRD2;

@property(nonatomic,retain) CCAnimation *ML3;
@property(nonatomic,retain) CCAnimation *MR3;
@property(nonatomic,retain) CCAnimation *MLD3;
@property(nonatomic,retain) CCAnimation *MRD3;
@property(nonatomic,retain) CCAnimation *MBLD3;
@property(nonatomic,retain) CCAnimation *MBRD3;


@property(nonatomic,retain) CCAnimation *MF1;
@property(nonatomic,retain) CCAnimation *MF2;
@property(nonatomic,retain) CCAnimation *MF3;
@property(nonatomic,retain) CCAnimation *MB1;
@property(nonatomic,retain) CCAnimation *MB2;
@property(nonatomic,retain) CCAnimation *MB3;

@end
