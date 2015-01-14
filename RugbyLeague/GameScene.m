//
//  GameScene.m
//  RugbyLeague
//
//  Created by khawar ali on 1/1/13.
//
//

#import "GameScene.h"

@implementation GameScene
-(id)init {
    self = [super init];
    if (self != nil) {
        // Background Layer
        //BackgroundLayer *backgroundLayer = [BackgroundLayer node]; // 1
        //[self addChild:backgroundLayer z:0];                       // 2
        // Gameplay Layer
        GameplayLayer = [gameplayLayer node];       // 3
        [self addChild:GameplayLayer z:0 tag:kGamePlayLayerTag];
        // 4
            }
    return self;
}

@end
