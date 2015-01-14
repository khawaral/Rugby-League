//
//  BackgroundLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/1/13.
//
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer
-(id)init{
    self=[super init];
    if(self!=nil)
    {
        CCSprite *backgroundImage;
        
            backgroundImage=[CCSprite spriteWithFile:@"field grass.jpg"];
         CGSize screenSize = [[CCDirector sharedDirector] winSize]; // 4
        if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
        {
            [backgroundImage setScaleX:screenSize.width/1024];
            [backgroundImage setScaleY:screenSize.height/768];
        }
       
       
        screenSize = [[CCDirector sharedDirector] winSize];
        [backgroundImage setPosition:
         CGPointMake(screenSize.width/2, screenSize.height*2.5)]; // 5
        
        [self addChild:backgroundImage z:0 tag:0];
     


    }

    return self;
}
@end
