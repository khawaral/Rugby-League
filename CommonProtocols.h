//
//  CommonProtocols.h
//  RugbyLeague
//
//  Created by khawar ali on 1/6/13.
//
//

#ifndef RugbyLeague_CommonProtocols_h
#define RugbyLeague_CommonProtocols_h

//for making the players move before the game starts i.e. initially
BOOL gameHasStarted;
BOOL gameHasWon;
BOOL gameHasLost;

//for identifying which player has the ball
int playerHasBall;

//for desired position of each player in reference to the player with ball
int desiredLocation1;
int desiredLocation2;
int desiredLocation3;

int pointerHasBeenAdded;
float milliSecondsToReachTheStart;


CGSize screenSize2;

typedef enum{
    kStateIdle,
    kStateReceiving,
    KstateRunningForward,
    KstateRunningBackward,
    KstateRunningRight,
    KstateRunningLeft,
    KstateRunningRightDiagnol,
    KstateRunningBackwardRightDiagnol,
    KstateRunningLeftDiagnol,
    KstateRunningBackwardLeftDiagnol,
    
    kstateStandingRight,
    kstateStandingLeft,
    kstateStandingForward,
    kstateStandingBackward,
    kstateStandingRightDiagnol,
    kstateStandingLeftDiagnol,
    kstateStandingBackwardLeftDiagnol,
    kstateStandingBackwardRightDiagnol,
    
    
    //Falling Down States
    kstateFallingDownBackward,
    kstateFallingDownForward,
    kstateFallingDownRight,
    kstateFallingDownLeft,
    kstateFallingDownBackwardLeftDiagnol,
    kstateFallingDownBackwardRightDiagnol,
    kstateFallingDownLeftDiagnol,
    kstateFallingDownRightDiagnol,
    
    kStateBackgroundStarting,
    kStateBackgroundMoving,
    kStateBackgroundNotMovingRight,
    kStateBackgroundNotMovingLeft,
    kStateBackgroundNotMovingBackward,
    kStateBackgroundNotMovingForward,
    kStateCelebrating,
    kStateNone
} CharacterStates;

typedef enum{
    kPlayer,
    kOpponent,
    kBall,
    kSpeedUp,
    kBackground,
    kObjectTypeNone
}GameObjectType;

typedef enum{
    kDirectionRight,
    kDirectionLeft
}BallDirection;

@protocol gameplayLayerDelegate

-(void)createObjectOfType:(GameObjectType)objectType atLocation:(CGPoint)spawnLocationwithZValue:(int)ZValue;

-(void)createBallWithDirection: (BallDirection) ballDirection andPosition: (CGPoint)spawnPosition;
@end
#endif
