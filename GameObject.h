//
//  GameObject.h
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "CCSprite.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Constants.h"
#import "CommonProtocols.h"


@interface GameObject : CCSprite{
    BOOL isActive;
    BOOL reactsToScreenBoundries;
    CGSize screenSize;
    GameObjectType gameObjectType;
    CharacterStates characterState;
}

@property (readwrite) BOOL isActive;
@property (readwrite) BOOL reactsToScreenBoundaries;
@property (readwrite) CGSize screenSize;
@property (readwrite) GameObjectType gameObjectType;
@property (readwrite) CharacterStates characterState;

-(void)changeState:(CharacterStates)newState;          

-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects;

-(CGRect)adjustedBoundingBox;

-(CCAnimation*)loadPlistForAnimationWithName:(NSString*)animationName andClassName:(NSString*)className;

-(void)moveBallFrom:(CGPoint)firstPosition to: (CGPoint)secondPosition;

@end
