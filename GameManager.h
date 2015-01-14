//
//  GameManager.h
//  RugbyLeague
//
//  Created by khawar ali on 1/22/13.
//
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface GameManager : NSObject
{
    BOOL isMusicOn;
    BOOL hasPlayerDied;
    SceneTypes currentScene;
}

@property(readwrite) BOOL isMusicOn;
@property(readwrite) BOOL hasPlayerDied;

+(GameManager*)sharedGameManager;
-(void)runSceneWithID:(SceneTypes)sceneID;

@end
