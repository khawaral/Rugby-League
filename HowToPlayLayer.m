//
//  HowToPlayLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/24/13.
//
//

#import "HowToPlayLayer.h"

@interface HowToPlayLayer()
-(void)displayMainMenu;
@end

@implementation HowToPlayLayer

-(void)sceneSelect
{
    [[GameManager sharedGameManager]runSceneWithID:kStageSelectScene];
}

-(void)displayMainMenu
{
    CGSize screenSize=[CCDirector sharedDirector].winSize;
    CCMenuItemImage *playButton=[CCMenuItemImage itemWithNormalImage:@"playButton2.png" selectedImage:@"playButton2.png" disabledImage:@"playButton2.png"  target:self selector:@selector(sceneSelect)];
    
    playButton.position=CGPointMake(screenSize.width/1.25,screenSize.height/9.36);
    
    mainMenu=[CCMenu menuWithItems:playButton, nil];
    [mainMenu setPosition:ccp(0,0)];
    // CGSize screenSize4=[CCDirector sharedDirector].winSize;
    [self addChild:mainMenu z:2];
    if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        screenSize=[CCDirector sharedDirector].winSizeInPixels;
        [playButton setScaleX:screenSize.width/1024];
        [playButton setScaleY:screenSize.height/768];
    }

}
-(id)init
{
    self=[super init];
    if(self!=nil)
    {
        CGSize screenSize=[CCDirector sharedDirector].winSize;
        CCSprite *background=[CCSprite spriteWithFile:@"howToPlayBackground.png"];
        [background setPosition:ccp(screenSize.width/2, screenSize.height/2)];

        [self addChild:background];
        
        [self displayMainMenu];
        
        if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
        {
            screenSize=[CCDirector sharedDirector].winSizeInPixels;
            [background setScaleX:screenSize.width/1024];
            [background setScaleY:screenSize.height/768];

        }
    }
    //CGSize screenSize=[CCDirector sharedDirector].winSize;
    return  self;
}




@end
