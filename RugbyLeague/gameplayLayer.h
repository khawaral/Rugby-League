//
//  gameplayLayer.h
//  RugbyLeague
//
//  Created by khawar ali on 1/1/13.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"
#include "Constants.h"
#include "CommonProtocols.h"
#include "BackgroundImage.h"
#include "Players.h"
#include "Ball.h"
#include "Pointer.h"
#include "Opponents.h"
#include "Circle.h"

@interface gameplayLayer : CCLayer
{

    SneakyJoystick *leftJoystick;
    SneakyButton *passButton;
    SneakyButton *passButton2;
    CCSpriteBatchNode *sceneSpriteBatchNode;
    Players *ourPlayer1;
    Players *ourPlayer2;
    Players *ourPlayer3;
    //Opponents *opponent1;
    //Opponents *opponent2;
    //Opponents *opponent3;
    BackgroundImage *backgroundImage;
    //CCSprite *pointer;
    Ball *ball;
    Pointer *pointer;
    CCLabelTTF *gameBeginLabel;
    int global;
    id labelAction;
    Circle *circle;
}

-(void)createObjectOfType:(int)x and:(int)y;

@end
