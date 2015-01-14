//
//  gameplayLayer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/1/13.
//
//

#import "gameplayLayer.h"

@implementation gameplayLayer



-(void)initJoystickAndButtons {
    CGSize screenSize = [CCDirector sharedDirector].winSize;       // 1
    CGRect joystickBaseDimensions=    CGRectMake(0, 0, 128.0f, 128.0f);                      // 2
    CGRect passButtonDimensions=    CGRectMake(0, 0, 64.0f, 64.0f);
   
    CGRect passButton2Dimensions=CGRectMake(0, 0, 64.0f, 64.0f);
    
    CGPoint joystickBasePosition;                                  // 3
    CGPoint passButtonPosition;
    
    CGPoint passButton2Position;
    
   

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {    // 4
        // The device is an iPad running iPhone 3.2 or later.
        
        CCLOG(@"Positioning Joystick and Buttons for iPad");
        joystickBasePosition = ccp(screenSize.width*0.0625f,
                                   screenSize.height*0.052f);
        
        passButtonPosition = ccp(screenSize.width*0.946f,
                                 screenSize.height*0.052f);
                passButton2Position=ccp(screenSize.width*0.73f,screenSize.height*0.052f);
        /*
        joystickBaseDimensions=CGRectMake(0, 0, 128,128);
        passButtonDimensions=CGRectMake(0, 0, 64,64);
        */
    } else {
        /*
        joystickBaseDimensions=CGRectMake(0, 0, 128/1024*screenSize.height, 128/768*screenSize.width);
        passButtonDimensions=CGRectMake(0, 0, 64/1024*screenSize.height, 64/768*screenSize.width);
         */
//        joystickBaseDimensions=CGRectMake(0, 0, 90,90);
  //      passButtonDimensions=CGRectMake(0, 0, 45,45);

        
        // The device is an iPhone or iPod touch.
        CCLOG(@"Positioning Joystick and Buttons for iPhone");
        joystickBasePosition = ccp(screenSize.width*0.07f,
                                   screenSize.height*0.11f);
        
        passButtonPosition = ccp(screenSize.width*0.93f,
                                 screenSize.height*0.11f);
        
        passButton2Position=ccp(screenSize.width*0.73f,screenSize.height*0.11f);
    }
    
    SneakyJoystickSkinnedBase *joystickBase =
    [[[SneakyJoystickSkinnedBase alloc] init] autorelease];        // 5
    joystickBase.position = joystickBasePosition;                  // 6
    
    
    
    
    joystickBase.backgroundSprite =
    [CCSprite spriteWithFile:@"dpadDown.png"];                     // 7
    joystickBase.thumbSprite =
    [CCSprite spriteWithFile:@"joystickDown.png"];                 // 8
    if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad)
    {
//        [joystickBase setScaleX:0.5];
  //      [joystickBase setScaleY:0.5];
    }

    joystickBase.joystick = [[SneakyJoystick alloc]
                             initWithRect:joystickBaseDimensions]; // 9
    leftJoystick = [joystickBase.joystick retain];                // 10
    [self addChild:joystickBase z:20];                                 // 11
    
    SneakyButtonSkinnedBase *passButtonBase =
    [[[SneakyButtonSkinnedBase alloc] init] autorelease];        // 12
    SneakyButtonSkinnedBase *passButton2Base =
    [[[SneakyButtonSkinnedBase alloc] init] autorelease];        // 12

    passButtonBase.position = passButtonPosition;                // 13
    passButton2Base.position = passButton2Position;                // 13
    
    passButtonBase.defaultSprite =
    [CCSprite spriteWithFile:@"jumpUp.png"];                     // 14
    passButtonBase.activatedSprite =
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 15
    passButtonBase.pressSprite =
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 16
    
    passButton2Base.defaultSprite =
    [CCSprite spriteWithFile:@"jumpUp.png"];                     // 14
    passButton2Base.activatedSprite =
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 15
    passButton2Base.pressSprite =
    [CCSprite spriteWithFile:@"jumpDown.png"];                   // 16

    
    passButtonBase.button = [[SneakyButton alloc]
                             initWithRect:passButtonDimensions]; // 17
    passButton2Base.button = [[SneakyButton alloc]
                             initWithRect:passButton2Dimensions]; // 17

    passButton = [passButtonBase.button retain];                 // 18
    passButton2 = [passButton2Base.button retain];                 // 18

    passButton.isToggleable = NO;                                // 19
        passButton2.isToggleable = NO;
    //
    
    [self addChild:passButtonBase z:20];                              // 20
    [self addChild:passButton2Base z:20];                              // 20
    
    if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        screenSize=[CCDirector sharedDirector].winSizeInPixels;

        [passButtonBase setScaleX:screenSize.width/480];
        [passButtonBase setScaleY:screenSize.height/360];
        [passButton2Base setScaleX:screenSize.width/480];
        [passButton2Base setScaleY:screenSize.height/360];
        [joystickBase setScaleX:screenSize.width/480];
        [joystickBase setScaleY:screenSize.height/360];
        
        /*
        [passButton setScaleX:screenSize.width/1024];
        [passButton setScaleY:screenSize.height/768];
        
        [passButton2 setScaleX:screenSize.width/1024];
        [passButton2 setScaleY:screenSize.height/768];
         */
    }
    
    
    }
/*
-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)tempNode forTimeDelta:(float)deltaTime
{
    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 128.0f); // 1
    //decrease the above number for slower response
    CGPoint newPosition;
    if(tempNode.position.x>=900&&scaledVelocity.x>0)
    {
        newPosition =
        ccp(tempNode.position.x ,
            tempNode.position.y + scaledVelocity.y * deltaTime);
    }
    else
    {
    newPosition =
    ccp(tempNode.position.x + scaledVelocity.x * deltaTime,
        tempNode.position.y + scaledVelocity.y * deltaTime);
    }// 2
    
    [tempNode setPosition:newPosition];                            // 3
    
    if (passButton.active == YES) {
        CCLOG(@"Jump button is pressed.");                         // 4
    }
  
}
*/
#pragma mark -
#pragma mark Update Method
-(void) update:(ccTime)deltaTime
{

        //[self applyJoystick:leftJoystick toNode:vikingSprite forTimeDelta:deltaTime];
    milliSecondsToReachTheStart+=deltaTime;
    //CCLOG(@"%f",milliSecondsToReachTheStart);
        CCArray *listOfGameObjects=[sceneSpriteBatchNode children];
        for(GameCharacter *tempChar in listOfGameObjects)
        {
            
            
            [tempChar updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
            
            
        }
    [backgroundImage updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
    //[circle updateStateWithDeltaTime:deltaTime andListOfGameObjects:listOfGameObjects];
    
    /*
    if(ourPlayer1.position.x<400)
    {
    [self applyJoystick:leftJoystick toNode:ourPlayer1 forTimeDelta:deltaTime];
    }
    if(ourPlayer2.position.x<400)
    {
    [self applyJoystick:leftJoystick toNode:ourPlayer2 forTimeDelta:deltaTime];
    }
    if(ourPlayer3.position.x<400)
    {
    [self applyJoystick:leftJoystick toNode:ourPlayer3 forTimeDelta:deltaTime];
    }
    
    [self applyJoystick:leftJoystick toNode:ourPlayer1 forTimeDelta:deltaTime];
    [self applyJoystick:leftJoystick toNode:ourPlayer2 forTimeDelta:deltaTime];
    [self applyJoystick:leftJoystick toNode:ourPlayer3 forTimeDelta:deltaTime];
     */
}

-(void)scheduledFunction
{
    //CCLabelTTF *gameBeginLabel;
    if(global==0)
    {
        gameBeginLabel=[CCLabelTTF labelWithString:@"2" fontName:@"Helvetica" fontSize:64];
        gameBeginLabel.color=ccc3(20, 20, 200);
        
    }
    else if (global==1)
    {
        gameBeginLabel=[CCLabelTTF labelWithString:@"1" fontName:@"Helvetica" fontSize:64];
        gameBeginLabel.color=ccc3(20, 20, 200);
        

        

        
    }
    else if (global==2)
    {
        [ourPlayer1 setJoystick:leftJoystick];
        [ourPlayer1 setPassButton:passButton];
        [ourPlayer1 setPassButton2:passButton2];
        /*
         [opponent1 setJoystick:leftJoystick];
         [opponent2 setJoystick:leftJoystick];
         [opponent3 setJoystick:leftJoystick];
         */
        
        [ourPlayer2 setJoystick:leftJoystick];
        [ourPlayer2 setPassButton:passButton];
        [ourPlayer2 setPassButton2:passButton2];
        
        [ourPlayer3 setJoystick:leftJoystick];
        [ourPlayer3 setPassButton:passButton];
        [ourPlayer3 setPassButton2:passButton2];
        
        //circle=[[Circle alloc]initWithFile:@"C1.png"];
        // CGSize screenSize3=[CCDirector sharedDirector].winSize;
        
        //  [circle setPosition:CGPointMake(screenSize3.width/2, screenSize3.height/2.6)];
        // [self addChild:circle];
        //CGSize screenSize2=[CCDirector sharedDirector].winSizeInPixels;
        milliSecondsToReachTheStart=0;
        
        //  [circle setScaleX:screenSize2.width/1024];
        //  [circle setScaleY:screenSize2.height/768];
    }

    if(global<=1)
    {
    CGSize screenSize = [CCDirector sharedDirector].winSize;
    
    [gameBeginLabel setPosition:ccp(screenSize.width/2,screenSize.height/2)];
    CCLOG(@"%f abc  %f", gameBeginLabel.position.x,gameBeginLabel.position.y);
    [self addChild:gameBeginLabel];
    id labelAction2=[CCSpawn actions:[CCScaleBy actionWithDuration:2.0f scale:4.0],[CCFadeOut actionWithDuration:2.0f], nil];
       // [gameBeginLabel stopAllActions];
    [gameBeginLabel runAction:labelAction2];
        
    }
    global++;
}

#pragma mark-
-(void)createObjectOfType:(int)x and:(int)y
{
    Opponents *opponent=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
    [opponent setPosition:CGPointMake(x, y)];
    [opponent setJoystick:leftJoystick];
    [sceneSpriteBatchNode addChild:opponent z:30];
   
    if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
    {
        CGSize screenSizeVar=[CCDirector sharedDirector].winSizeInPixels;
        
        [opponent setScaleX:screenSizeVar.width/1024];
        [opponent setScaleY:screenSizeVar.height/768];
    }

    [opponent release];
}


-(id)init {
    self = [super init];
    if (self != nil) {
        global=0;
        gameHasStarted=NO;
        gameHasWon=NO;
        gameHasLost=NO;
        pointerHasBeenAdded=1;
        

        
        CGSize screenSize = [CCDirector sharedDirector].winSize;  // 1 
        // enable touches
        
        
        int opponentPositionsArrayx[50]={-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367,-screenSize.width/2,screenSize.width/5.12,screenSize.width/2,screenSize.width/1.28,screenSize.width*1.367};
        
        int opponentPositionsArrayy[50]={screenSize.height*1.3,screenSize.height*1.3,screenSize.height*1.3,screenSize.height*1.3,screenSize.height*1.3,screenSize.height*1.73,screenSize.height*1.73,screenSize.height*1.73,screenSize.height*1.73,screenSize.height*1.73,screenSize.height*2.17,screenSize.height*2.17,screenSize.height*2.17,screenSize.height*2.17,screenSize.height*2.17,screenSize.height*2.60,screenSize.height*2.60,screenSize.height*2.60,screenSize.height*2.60,screenSize.height*2.60,screenSize.height*3.03,screenSize.height*3.03,screenSize.height*3.03,screenSize.height*3.03,screenSize.height*3.03,screenSize.height*3.46,screenSize.height*3.46,screenSize.height*3.46,screenSize.height*3.46,screenSize.height*3.46,screenSize.height*3.89,screenSize.height*3.89,screenSize.height*3.89,screenSize.height*3.89,screenSize.height*3.89,screenSize.height*4.32,screenSize.height*4.32,screenSize.height*4.32,screenSize.height*4.32,screenSize.height*4.32,screenSize.height*4.75,screenSize.height*4.75,screenSize.height*4.75,screenSize.height*4.75,screenSize.height*4.75,screenSize.height*5.18,screenSize.height*5.18,screenSize.height*5.18,screenSize.height*5.18,screenSize.height*5.18};
        
        
        self.isTouchEnabled = YES;                                // 2
        
        
        [[CCSpriteFrameCache sharedSpriteFrameCache]
         addSpriteFramesWithFile:@"RugbyLeague3.plist"];          // 1
        sceneSpriteBatchNode =
        [CCSpriteBatchNode batchNodeWithFile:@"RugbyLeague3.png" capacity:50]; // 2
        
        /*
        opponent1=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
        [opponent1 setPosition:CGPointMake(400, 250)];
         [opponent1 setJoystick:leftJoystick];
        [sceneSpriteBatchNode addChild:opponent1 z:30];
         */
        
        /*
        ourPlayer1=[CCSprite spriteWithSpriteFrameName:@"Player 1 images/player1F3.png"];
        ourPlayer2=[CCSprite spriteWithSpriteFrameName:@"Player 2 images/player2F3.png"];
        ourPlayer3=[CCSprite spriteWithSpriteFrameName:@"Player 3 images/player3F3.png"];
        */

        [self addChild:sceneSpriteBatchNode z:10 tag:kBatchNodeTagValue];
[self initJoystickAndButtons];
        
        ourPlayer1=[[Players alloc]initWithSpriteFrameName:@"player1F3.png"];
        ourPlayer2=[[Players alloc]initWithSpriteFrameName:@"player2F3.png"];
        ourPlayer3=[[Players alloc]initWithSpriteFrameName:@"player3F3.png"];
        
        //opponent codE
        /*
        opponent1=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
        [opponent1 setPosition:CGPointMake(400, 250)];
        
        opponent2=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
        [opponent2 setPosition:CGPointMake(100, 250)];
        
        opponent3=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
        [opponent3 setPosition:CGPointMake(250, 500)];
        */
        
        [ourPlayer1 setPosition:
         CGPointMake(screenSize.width/1.30,screenSize.height*0.12f)];
        [ourPlayer2 setPosition:
         CGPointMake(screenSize.width/2,screenSize.height*0.12)];
        [ourPlayer3 setPosition:
         CGPointMake(screenSize.width/4.36,screenSize.height*0.12f)];
     

        [ourPlayer1 setRelativeLocation:1];
        [ourPlayer2 setRelativeLocation:2];
        [ourPlayer3 setRelativeLocation:3];
        

        
        
        
        [ourPlayer1 setDesiredLocation:1];
        [ourPlayer2 setDesiredLocation:2];
        [ourPlayer3 setDesiredLocation:3];
        
        
        /*
        [ourPlayer1 setDesiredPosition:1];
        [ourPlayer2 setDesiredPosition:2];
        [ourPlayer3 setDesiredPosition:3];
        */
        
        playerHasBall=2;
        [ourPlayer1 setHasBall:false];
        [ourPlayer2 setHasBall:true];
        [ourPlayer3 setHasBall:false];


        
        /*
        desiredLocation1=1;
        desiredLocation2=2;
        desiredLocation3=3;
         */

  /*
        
        [ourPlayer1 setPosition:
         CGPointMake(screenSize.height-(screenSize.height/5.12),
                     screenSize.width*0.12f)];
        [ourPlayer2 setPosition:
         CGPointMake(screenSize.height/2,
                     screenSize.width*0.17f)];
        [ourPlayer3 setPosition:
         CGPointMake(screenSize.height/5.12,
                     screenSize.width*0.12f)];
    */    
        /*
        [ourPlayer1 setJoystick:leftJoystick];
        [ourPlayer1 setPassButton:passButton];
        [ourPlayer1 setPassButton2:passButton2];
        

        
        [ourPlayer2 setJoystick:leftJoystick];
        [ourPlayer2 setPassButton:passButton];
        [ourPlayer2 setPassButton2:passButton2];

        [ourPlayer3 setJoystick:leftJoystick];
        [ourPlayer3 setPassButton:passButton];
        [ourPlayer3 setPassButton2:passButton2];
        */
        
        

        /*
         opponent1=[[Opponents alloc]initWithSpriteFrameName:@"OB3.png"];
         [opponent1 setPosition:CGPointMake(400, 250)];
         [opponent1 setJoystick:leftJoystick];
         [sceneSpriteBatchNode addChild:opponent1 z:30];
         */
        
        
        
        [sceneSpriteBatchNode addChild:ourPlayer1 z:kOurPlayerZValue tag:kOurPlayer1TagValue];
        [sceneSpriteBatchNode addChild:ourPlayer2 z:kOurPlayerZValue tag:kOurPlayer2TagValue];
        [sceneSpriteBatchNode addChild:ourPlayer3 z:kOurPlayerZValue tag:kOurPlayer3TagValue];
        
        int randomCheckArray[50]={0};
        CCLOG(@"Random number generation starting");
        NSDate *now=[NSDate date];
        CCLOG(@"%@",now);
        for(int i=0;i<(4*numberStage+levelNumber);i++)
      //  for(int i=0;i<0;i++)
        {
        int random;
        random=arc4random()%50;
            if(randomCheckArray[random]==0)
            {
                randomCheckArray[random]=1;
                [self createObjectOfType:opponentPositionsArrayx[random] and:opponentPositionsArrayy[random]];
                
            }
            else
            {
                while(randomCheckArray[random]!=0)
                {
                    random=arc4random()%50;
                }
                
                if(randomCheckArray[random]==0)
                {
                    randomCheckArray[random]=1;
                    [self createObjectOfType:opponentPositionsArrayx[random] and:opponentPositionsArrayy[random]];
                    
                }
            }
        }
        CCLOG(@"Random number generation ended");
        now=[NSDate date];
        CCLOG(@"%@",now);
        
        /*
        [sceneSpriteBatchNode addChild:opponent1 z:30];
        [sceneSpriteBatchNode addChild:opponent2 z:30];
        [sceneSpriteBatchNode addChild:opponent3 z:30];
        */
        ball=[[Ball alloc]initWithSpriteFrameName:@"empty.png"];
        [ball setPosition:ourPlayer2.position];
        [ball setPassButton:passButton];
        [ball setPassButton2:passButton2];
        [sceneSpriteBatchNode addChild:ball z:kOurPlayerZValue tag:kBallTagValue];
        
        pointer=[[Pointer alloc]initWithSpriteFrameName:@"Ball.png"];
        [pointer setPosition:ourPlayer2.position];
        [sceneSpriteBatchNode addChild:pointer z:150];
        /*
        [sceneSpriteBatchNode addChild:ourPlayer1];
        [sceneSpriteBatchNode addChild:ourPlayer2];
        [sceneSpriteBatchNode addChild:ourPlayer3];
        */
        backgroundImage=[[BackgroundImage alloc]initWithFile:@"field grass5.png"];
        [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height*2.5)];
        [backgroundImage setJoystick:leftJoystick];
        [backgroundImage setPassButton:passButton];
        
        
        [self addChild:backgroundImage z:0 tag:kBackgroundImageTagValue];
        //220 160
        
        
        //CCSprite *start=[[CCSprite alloc]initWithFile:@"Box1.png"];
        //start.position=CGPointMake(260, 200);
        //[self addChild:start];
        
       // CCLOG(@"%f,   %f", start.contentSize.height,start.contentSize.width);
        
        
        //label with 3 2 1
        gameBeginLabel=[CCLabelTTF labelWithString:@"3" fontName:@"Helvetica" fontSize:64];
        gameBeginLabel.color=ccc3(20, 20, 200);
        [gameBeginLabel setPosition:ccp(screenSize.width/2,screenSize.height/2)];
        [self addChild:gameBeginLabel];
        labelAction=[CCSpawn actions:[CCScaleBy actionWithDuration:2.0f scale:4.0],[CCFadeOut actionWithDuration:1.0f], nil];
        CCLOG(@"%f   %f", gameBeginLabel.position.x,gameBeginLabel.position.y);
        [gameBeginLabel runAction:labelAction];
        
        
        [self schedule:@selector(scheduledFunction) interval:1.0f];
//        [self performSelector:@selector(scheduledFunction) withObject:nil afterDelay:3.0f];
        
        
        if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad)
        {
            screenSize=[CCDirector sharedDirector].winSizeInPixels;
            if(screenSize.width==1024)
            {
                [backgroundImage setScaleX:3.93];
                [backgroundImage setScaleY:3.93];
            }
            if(screenSize.width==2048)
            {
                [backgroundImage setScaleX:7.86];
                [backgroundImage setScaleY:7.86];
                
                [ourPlayer1 setScaleX:screenSize.width/1024];
                [ourPlayer1 setScaleY:screenSize.height/768];
                [ourPlayer2 setScaleX:screenSize.width/1024];
                [ourPlayer2 setScaleY:screenSize.height/768];
                [ourPlayer3 setScaleX:screenSize.width/1024];
                [ourPlayer3 setScaleY:screenSize.height/768];
                //[circle setScaleX:screenSize.width/1024];
                //[circle setScaleY:screenSize.height/768];
            }
        }

        
        if(UI_USER_INTERFACE_IDIOM()!=UIUserInterfaceIdiomPad)
        {
            screenSize=[CCDirector sharedDirector].winSizeInPixels;

            /*
            CGSize size=backgroundImage.contentSize;
            CCLOG(@"%f, %f",size.width,size.height);
            */
            if(screenSize.width==480)
            {
            [backgroundImage setScaleX:1.844];
            [backgroundImage setScaleY:1.64];
            }
            
            if(screenSize.width==960)
            {
                [backgroundImage setScaleX:3.688];
                [backgroundImage setScaleY:3.28];
            }
            
            if(screenSize.width==1136)
            {
                [backgroundImage setScaleX:4.36];
                [backgroundImage setScaleY:3.28];
            }
            
            
            
            /*
            [backgroundImage setScaleX:screenSize.width/1024];
            [backgroundImage setScaleY:screenSize.height/768];
            
            
            CGRect rect=backgroundImage.boundingBox;
            size=rect.size;
            CCLOG(@"%f, %f",size.width,size.height);
            */
            [ourPlayer1 setScaleX:screenSize.width/1024];
            [ourPlayer1 setScaleY:screenSize.height/768];
            [ourPlayer2 setScaleX:screenSize.width/1024];
            [ourPlayer2 setScaleY:screenSize.height/768];
            [ourPlayer3 setScaleX:screenSize.width/1024];
            [ourPlayer3 setScaleY:screenSize.height/768];
           // [circle setScaleX:screenSize.width/1024];
           // [circle setScaleY:screenSize.height/768];
            /*
            [opponent1 setScaleX:screenSize.width/1024];
            [opponent1 setScaleY:screenSize.height/768];
            [opponent2 setScaleX:screenSize.width/1024];
            [opponent2 setScaleY:screenSize.height/768];
            [opponent3 setScaleX:screenSize.width/1024];
            [opponent3 setScaleY:screenSize.height/768];
            */
            /*
            [leftJoystick setScaleX:screenSize.width/1024];
            [leftJoystick setScaleY:screenSize.height/768];
            [passButton setScaleX:screenSize.width/1024];
            [passButton setScaleY:screenSize.height/768];
            [passButton2 setScaleX:screenSize.width/1024];
            [passButton2 setScaleY:screenSize.height/768];
            */
        }
        

       
        
        
        [self scheduleUpdate];
    }
    return self;
}


@end
