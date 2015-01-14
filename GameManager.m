//
//  GameManager.m
//  RugbyLeague
//
//  Created by khawar ali on 1/22/13.
//
//

#import "GameManager.h"
#import "MainMenuScene.h"
#import "GameScene.h"
#import "HowToPlayScene.h"
#import "StageSelectScene.h"
#import "BetweenLevelScene.h"

@implementation GameManager

static GameManager* _sharedGameManager=nil;


@synthesize isMusicOn;
@synthesize hasPlayerDied;

+(GameManager*)sharedGameManager
{
    @synchronized ([GameManager class])
    {
        if(!_sharedGameManager)
            [[self alloc]init];
        
            return _sharedGameManager;
    }
    return nil;
}

+(id)alloc
{
    @synchronized ([GameManager class])
    {
        NSAssert(_sharedGameManager==nil,@"Attempting to allocate a second instance of the Game Manager Singleton");
        _sharedGameManager=[super alloc];
        return  _sharedGameManager;
    }
    return nil;
}

-(id)init
{
    self=[super init];
    if(self!=nil)
    {
        //Game Manager initialized
        CCLOG(@"Game Manager Singleton, init");
        isMusicOn=YES;
        hasPlayerDied=NO;
        currentScene=kNoSceneUninitialized;
    }
    return  self;
}

-(void)runSceneWithID:(SceneTypes)sceneID
{
    SceneTypes oldScene=currentScene;
    currentScene=sceneID;
    id sceneToRun=nil;
    switch (sceneID) {
        case kMainMenuScene:
        {
            
            sceneToRun=[MainMenuScene node];
            break;
        }
        case kHowToPlayScene:
        {
            sceneToRun=[HowToPlayScene node];
            break;
        }
        case kGameScene:
        {
            sceneToRun=[GameScene node];
            break;
        }
        case kStageSelectScene:
        {
            sceneToRun=[StageSelectScene node];
            break;
        }
            case  kBetweenLevelsScene:
        {
            sceneToRun=[BetweenLevelScene node];
            break;
        }
        default:
            CCLOG(@"Unknown ID, cannot switch scenes");
            return;
            break;
    }
    if(sceneToRun==nil)
    {
        //Revert back, since no new scene was found
        currentScene=oldScene;
        return;
    }
    
    //Menu scenes have a value less then 100
    /*
    if(sceneID<100)
    {
        if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
        {
            CGSize screenSize=[CCDirector sharedDirector].winSizeInPixels;
            [sceneToRun setScaleX:screenSize.width/1024];
            [sceneToRun setScaleY:screenSize.height/768];
        }
    }
     */
    if([[CCDirector sharedDirector]runningScene]==nil)
    {
        [[CCDirector sharedDirector]runWithScene:sceneToRun];
    }
    else
    {
        [[CCDirector sharedDirector]replaceScene:sceneToRun];
    }
}
@end
