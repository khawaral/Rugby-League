//
//  GameCharacter.h
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "GameObject.h"
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameCharacter : GameObject{
    int desiredLocation;
    BOOL hasBall;
}

@property(readwrite)BOOL hasBall;
@property(readwrite)int desiredLocation;
-(void)checkAndClampSpritePosition;

@end
