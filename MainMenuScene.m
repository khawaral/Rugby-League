//
//  MainMenuScene.m
//  RugbyLeague
//
//  Created by khawar ali on 1/23/13.
//
//

#import "MainMenuScene.h"
#import "CommonProtocols.h"
@implementation MainMenuScene
-(id)init {
    self = [super init];
    if (self != nil) {
        mainMenuLayer=[MainMenuLayer node];
        [self addChild:mainMenuLayer];
    }
    //screenSize2=[CCDirector sharedDirector].winSize;
    return self;
}
@end
