//
//  BetweenLevelScene.m
//  RugbyLeague
//
//  Created by khawar ali on 1/27/13.
//
//

#import "BetweenLevelScene.h"
#import "CommonProtocols.h"
@implementation BetweenLevelScene
-(id)init {
    self = [super init];
    if (self != nil) {
        betweenLevelLayer=[BetweenLevelLayer node];
        [self addChild:betweenLevelLayer];
    }
    return self;
}
@end
