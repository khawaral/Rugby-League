//
//  MainMenuLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/23/13.
//
//

#import "MainMenuLayer.h"

@interface MainMenuLayer()
-(void)displayMainMenu;
@end

@implementation MainMenuLayer

-(void)howtoplay
{
    CCLOG(@"Show how to play scene");
    numberOfTurnsLeft=3;
    //CGSize screenSize=[CCDirector sharedDirector].winSize;
    [[GameManager sharedGameManager]runSceneWithID:kHowToPlayScene];
}

-(void)settings
{
    CCLOG(@"Show how to settings scene");
    [[GameManager sharedGameManager]runSceneWithID:kSettingsScene];
}

-(void)highscores
{
    CCLOG(@"Show the stage selection scene");
    [[GameManager sharedGameManager]runSceneWithID:kHighScoresScene];
}

-(void)credits
{
    CCLOG(@"Show the credits scen");
    [[GameManager sharedGameManager]runSceneWithID:kCreditsScene];
}

-(void)displayMainMenu
{
    CGSize screenSize=[CCDirector sharedDirector].winSize;
    //Main menu
    CCMenuItemImage *newGameButton=[CCMenuItemImage itemWithNormalImage:@"button1.png" selectedImage:@"button1.png" disabledImage:@"button1.png"  target:self selector:@selector(howtoplay)];
    newGameButton.position=CGPointMake(screenSize.width/2.92,screenSize.height/1.41);
    

    CCMenuItemImage *settingsButton=[CCMenuItemImage itemWithNormalImage:@"button3.png" selectedImage:@"button3.png" disabledImage:@"button3.png"  target:self selector:@selector(settings)];
    settingsButton.position=CGPointMake(screenSize.width/1.51, screenSize.height/1.41);
    
    
    CCMenuItemImage *highscoresButton=[CCMenuItemImage itemWithNormalImage:@"button2.png" selectedImage:@"button2.png" disabledImage:@"button2.png"  target:self selector:@selector(highscores)];
    highscoresButton.position=CGPointMake(screenSize.width/2.92, screenSize.height/1.83);
    
    CCMenuItemImage *creditsButton=[CCMenuItemImage itemWithNormalImage:@"button4.png" selectedImage:@"button4.png" disabledImage:@"button4.png"  target:self selector:@selector(credits)];
    creditsButton.position=CGPointMake(screenSize.width/1.51, screenSize.height/1.83);
        
    mainMenu=[CCMenu menuWithItems:newGameButton,settingsButton,highscoresButton,creditsButton, nil];
    [mainMenu setPosition:ccp(0,0)];
   // CGSize screenSize4=[CCDirector sharedDirector].winSize;
    [self addChild:mainMenu z:2 tag:kMainMenuTagValue];
    
    if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        screenSize=[CCDirector sharedDirector].winSizeInPixels;
        [newGameButton setScaleX:screenSize.width/1024];
        [newGameButton setScaleY:screenSize.height/768];
        [settingsButton setScaleX:screenSize.width/1024];
        [settingsButton setScaleY:screenSize.height/768];
        [highscoresButton setScaleX:screenSize.width/1024];
        [highscoresButton setScaleY:screenSize.height/768];
        [creditsButton setScaleX:screenSize.width/1024];
        [creditsButton setScaleY:screenSize.height/768];
    }
    
    
}


-(void)loadStageNumberFromThePlist
{
    
    
    
    NSString *fullFileName =
    [NSString stringWithFormat:@"StageVariable.plist"];
    NSString *plistPath;
    
    // 1: Get the Path to the plist file
    NSString *rootPath =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                         NSUserDomainMask, YES) objectAtIndex:0];
    
    plistPath = [rootPath stringByAppendingPathComponent:fullFileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle]
                     pathForResource:@"StageVariable" ofType:@"plist"];
    }
    
    // 2: Read in the plist file
    
    NSDictionary *plistDictionary =
    [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    // 3: If the plistDictionary was null, the file was not found.
    if (plistDictionary == nil) {
        CCLOG(@"Error reading plist: StageVariable.plist");
        // No Plist Dictionary or file found
    }
    
    // 4: Get just the mini-dictionary for this animation
    
    numberStageFromPlist=[[plistDictionary objectForKey:@"StageNumber"] intValue];
    
    CCLOG(@"%x is stage",numberStageFromPlist);
    
    
}

-(id)init
{
    self=[super init];
    if(self!=nil)
    {
        CGSize screenSize=[CCDirector sharedDirector].winSize;
        CCSprite *background=[CCSprite spriteWithFile:@"Mock Splash2.png"];
        [background setPosition:ccp(screenSize.width/2, screenSize.height/2)];
       // [background setScale:0.3];
        [self addChild:background];
        [self displayMainMenu];
      
        if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
        {
            screenSize=[CCDirector sharedDirector].winSizeInPixels;
            [background setScaleX:screenSize.width/1024];
            [background setScaleY:screenSize.height/768];
        }
        [self loadStageNumberFromThePlist];
        levelNumber=1;
    }
    
    
    //CGSize screenSize=[CCDirector sharedDirector].winSize;
    return  self;
}
@end
