//
//  StageSelectLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/24/13.
//
//

#import "StageSelectLayer.h"

@interface StageSelectLayer()
-(void)displayMainMenu;
@end

@implementation StageSelectLayer

-(void)sceneSelect: (id)sender
{
    CCMenuItem *a=(CCMenuItem*)sender;
    numberStage=a.tag;
    
    [[GameManager sharedGameManager]runSceneWithID:kGameScene];
}

-(void)displayMainMenu
{
    CGSize screenSize=[CCDirector sharedDirector].winSize;
    
    CCMenuItemImage *Button1=[CCMenuItemImage itemWithNormalImage:@"Untitled1.png" selectedImage:@"Untitled1.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button1.position=CGPointMake(screenSize.width/3.84,screenSize.height/2);
    
    CCMenuItemImage *Button2=[CCMenuItemImage itemWithNormalImage:@"Untitled2.png" selectedImage:@"Untitled2.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button2.position=CGPointMake(screenSize.width/3.84,screenSize.height/2.81);
    
    CCMenuItemImage *Button3=[CCMenuItemImage itemWithNormalImage:@"Untitled3.png" selectedImage:@"Untitled3.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button3.position=CGPointMake(screenSize.width/3.84,screenSize.height/4.8);
    
    CCMenuItemImage *Button4=[CCMenuItemImage itemWithNormalImage:@"Untitled4.png" selectedImage:@"Untitled4.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button4.position=CGPointMake(screenSize.width/1.97,screenSize.height/2);
    
    CCMenuItemImage *Button5=[CCMenuItemImage itemWithNormalImage:@"Untitled5.png" selectedImage:@"Untitled5.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button5.position=CGPointMake(screenSize.width/1.97,screenSize.height/2.81);
    
    CCMenuItemImage *Button6=[CCMenuItemImage itemWithNormalImage:@"Untitled6.png" selectedImage:@"Untitled6.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button6.position=CGPointMake(screenSize.width/1.97,screenSize.height/4.8);
    
    CCMenuItemImage *Button7=[CCMenuItemImage itemWithNormalImage:@"Untitled7.png" selectedImage:@"Untitled7.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button7.position=CGPointMake(screenSize.width/1.32,screenSize.height/2);
    
    CCMenuItemImage *Button8=[CCMenuItemImage itemWithNormalImage:@"Untitled8.png" selectedImage:@"Untitled8.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button8.position=CGPointMake(screenSize.width/1.32,screenSize.height/2.81);
    
    CCMenuItemImage *Button9=[CCMenuItemImage itemWithNormalImage:@"Untitled9.png" selectedImage:@"Untitled9.png" disabledImage:@"locked.png"  target:self selector:@selector(sceneSelect:)];
    
    Button9.position=CGPointMake(screenSize.width/1.32,screenSize.height/4.8);
    
    //Button9.isEnabled=FALSE;
    Button1.tag=1;
    Button2.tag=2;
    Button3.tag=3;
    Button4.tag=4;
    Button5.tag=5;
    Button6.tag=6;
    Button7.tag=7;
    Button8.tag=8;
    Button9.tag=9;
   
    
    mainMenu=[CCMenu menuWithItems:Button1,Button2,Button3,Button4,Button5,Button6,Button7,Button8,Button9, nil];
    [mainMenu setPosition:ccp(0,0)];

    for(int i=numberStageFromPlist+1;i<=9;i++)
    {
    CCMenuItemImage *pauseButton=[mainMenu getChildByTag:i];
    [pauseButton setIsEnabled:FALSE];
    }
    

    
    // CGSize screenSize4=[CCDirector sharedDirector].winSize;
    [self addChild:mainMenu z:2];
    if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        screenSize=[CCDirector sharedDirector].winSizeInPixels;
        [Button1 setScaleX:screenSize.width/1024];
        [Button1 setScaleY:screenSize.height/768];
        [Button2 setScaleX:screenSize.width/1024];
        [Button2 setScaleY:screenSize.height/768];
        [Button3 setScaleX:screenSize.width/1024];
        [Button3 setScaleY:screenSize.height/768];
        [Button4 setScaleX:screenSize.width/1024];
        [Button4 setScaleY:screenSize.height/768];
        [Button5 setScaleX:screenSize.width/1024];
        [Button5 setScaleY:screenSize.height/768];
        [Button6 setScaleX:screenSize.width/1024];
        [Button6 setScaleY:screenSize.height/768];
        [Button7 setScaleX:screenSize.width/1024];
        [Button7 setScaleY:screenSize.height/768];
        [Button8 setScaleX:screenSize.width/1024];
        [Button8 setScaleY:screenSize.height/768];
        [Button9 setScaleX:screenSize.width/1024];
        [Button9 setScaleY:screenSize.height/768];
        
    }
    
}

-(id)init
{
    self=[super init];
    if(self!=nil)
    {
        CGSize screenSize=[CCDirector sharedDirector].winSize;
        CCSprite *background=[CCSprite spriteWithFile:@"stageSelectInterfaceBackground.png"];
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
