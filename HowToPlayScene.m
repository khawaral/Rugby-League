//
//  HowToPlayScene.m
//  RugbyLeague
//
//  Created by khawar ali on 1/24/13.
//
//

#import "HowToPlayScene.h"
#import "CommonProtocols.h"

@implementation HowToPlayScene

-(id)init {
    self = [super init];
    if (self != nil) {
        howToPlayLayer=[HowToPlayLayer node];
        [self addChild:howToPlayLayer];
    }
       return self;
}

@end
