//
//  StageSelectScene.m
//  RugbyLeague
//
//  Created by khawar ali on 1/24/13.
//
//

#import "StageSelectScene.h"
#import "CommonProtocols.h"
@implementation StageSelectScene

-(id)init {
    self = [super init];
    if (self != nil) {
        stageSelectLayer=[StageSelectLayer node];
        [self addChild:stageSelectLayer];
    }
    return self;
}

@end
