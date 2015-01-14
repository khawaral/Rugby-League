//
//  Ball.m
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "Ball.h"
@implementation Ball
@synthesize passButton;
@synthesize passButton2;

//global variables
//int global;

#pragma mark -
-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects
{

    if([self numberOfRunningActions]==0)
    {
    
    [self setDisplayFrame:[[CCSpriteFrameCache
                            sharedSpriteFrameCache]
                           spriteFrameByName:@"empty.png"]];
    }
    /*
    if(global==0)
    {
    ourPlayer1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
    ourPlayer2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
    ourPlayer3=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
    playerArray[0]=ourPlayer1;
    playerArray[1]=ourPlayer2;
    playerArray[2]=ourPlayer3;
        global=1;
    }
    
    for (int i=0; i<3; i++) {
        if(playerArray[i].hasBall==true)
        {
            self.position=playerArray[i].position;
            break;
        }
    }
    if(passButton.active==YES)
    {
        CCLOG(@"Pass button has been pressed");
    }
    if(passButton2.active==YES)
    {
        CCLOG(@"Pass button 2 has been pressed");
    }
     */
}

-(void)moveBallFrom:(CGPoint)firstPosition to:(CGPoint)secondPosition
{
    
    [self setDisplayFrame:[[CCSpriteFrameCache
                        sharedSpriteFrameCache]
                      spriteFrameByName:@"Ball.png"]];
     
    self.position=firstPosition;
    id action=    [CCMoveTo actionWithDuration:0.3f position:secondPosition];
    [self runAction:action];
}

-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        CCLOG(@"Ball initialized");
        //global=0;

        

        
    }
    return self;
}

@end
