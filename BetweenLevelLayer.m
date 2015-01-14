//
//  BetweenLevelLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/27/13.
//
//

#import "BetweenLevelLayer.h"

@implementation BetweenLevelLayer
-(void)sceneSelect
{
    [[GameManager sharedGameManager]runSceneWithID:kGameScene];
}

-(void)displayMainMenu
{
    CGSize screenSize=[CCDirector sharedDirector].winSize;
    CCMenuItemImage *playButton=[CCMenuItemImage itemWithNormalImage:@"playButton2.png" selectedImage:@"playButton2.png" disabledImage:@"playButton2.png"  target:self selector:@selector(sceneSelect)];
    
    playButton.position=CGPointMake(screenSize.width/1.18,screenSize.height/9.36);
    
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
        CCSprite *background;
        if(gameHasWon)
        {
        background=[CCSprite spriteWithFile:@"LevelSuccessful.png"];
        [background setPosition:ccp(screenSize.width/2, screenSize.height/2)];
        }
        if(gameHasLost)
        {
            background=[CCSprite spriteWithFile:@"LevelFailed.png"];
            [background setPosition:ccp(screenSize.width/2, screenSize.height/2)];
        }
        [self addChild:background];
        
        
       
        CCLabelTTF *stageNumberLabel=[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",numberStage] fontName:@"Helvetica" fontSize:64];
        stageNumberLabel.color=ccc3(20, 20, 200);
        [stageNumberLabel setPosition:ccp(160,180)];
        [self addChild:stageNumberLabel];

        CCLabelTTF *levelNumberLabel=[CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d",levelNumber] fontName:@"Helvetica" fontSize:64];
        levelNumberLabel.color=ccc3(20, 20, 200);
        [levelNumberLabel setPosition:ccp(160,120)];
        [self addChild:levelNumberLabel];
        
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
