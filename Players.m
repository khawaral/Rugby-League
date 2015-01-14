//
//  Players.m
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "Players.h"

@implementation Players

@synthesize playerHavingBallRightNow;
@synthesize background;
@synthesize joystick;
@synthesize passButton ;
@synthesize passButton2;
@synthesize relativeLocation;
@synthesize desiredPosition;

//@synthesize gameHasStarted;
@synthesize MC1;
@synthesize MC2;
@synthesize MC3;

@synthesize ML1;
@synthesize MR1;
@synthesize MLD1;
@synthesize MRD1;
@synthesize MBLD1;
@synthesize MBRD1;

@synthesize ML2;
@synthesize MR2;
@synthesize MLD2;
@synthesize MRD2;
@synthesize MBLD2;
@synthesize MBRD2;

@synthesize ML3;
@synthesize MR3;
@synthesize MLD3;
@synthesize MRD3;
@synthesize MBLD3;
@synthesize MBRD3;

@synthesize MF1;
@synthesize MF2;
@synthesize MF3;
@synthesize MB1;
@synthesize MB2;
@synthesize MB3;




-(void)applyJoystick:(SneakyJoystick *)aJoystick forTimeDelta:(float)deltaTime
{

    float x=pow(screenSize.height, 2)+pow(screenSize.width, 2);
    x=pow(x, 0.5);
    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, x/4.5);
    CGPoint oldPosition = [self position];
    CGPoint newPosition =
    ccp(oldPosition.x +
        scaledVelocity.x * deltaTime,
        oldPosition.y+scaledVelocity.y*deltaTime);
    
    if(gameHasStarted==NO&&hasBall==true)
    {
    
    [self setPosition:newPosition];
    //CCLOG(@"changing position");
        //CGRect rect=CGRectMake(screenSize.height/3.28, screenSize.width/3.28,screenSize.height/2.56 ,screenSize.width/2.56 );
        /*
          CGRect rect=CGRectMake(screenSize.height/2.125, screenSize.width/2,screenSize.height/17 ,screenSize.width/12.67);
       */
                //this call needs improvement, if it is moved to the right or left or forward without going through the region then they collide together as one stops while others keep moving
        [self checkAndClampSpritePosition];
    }
    
    //certain other conditions need to be put inside it
    if(gameHasStarted==YES&&hasBall==true)
    {
        background=(GameCharacter*)[[[self parent]parent] getChildByTag:kBackgroundImageTagValue];
        
        CharacterStates backgroundState;
        backgroundState=[background characterState];
        
        if(backgroundState!=kStateBackgroundMoving)
        {
            if(backgroundState==kStateBackgroundNotMovingLeft||backgroundState==kStateBackgroundNotMovingRight)
            {
            newPosition.y=oldPosition.y;
            }
        
            //CCLOG(@"%x",backgroundState);
            if(backgroundState==kStateBackgroundNotMovingForward)
            {
                CCLOG(@"%f,%f",self.position.x,self.position.y);
                if(self.position.y>screenSize.height/2)
                {
                    gameHasWon=YES;
                }
            }
            [self setPosition:newPosition];
           // CCLOG(@"changing position from not moving");
            
        }
        CCLOG(@"%f",self.position.x);
        [self checkAndClampSpritePosition];
        CCLOG(@"%f",self.position.x);
    }
    
    if(passButton.active==YES)
    {
        CCLOG(@"Pass the ball to the right");

        
    }
}



#pragma mark -
-(void)changeState:(CharacterStates)newState {
    [self stopAllActions];
    id action = nil;
    
    [self setCharacterState:newState];
    
    int x=[self tag];
    
     if(x==1)
     {
         
    switch (newState) {
        case kstateFallingDownBackward:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c421.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,-140)];
            
        }
            break;
            
        case kstateFallingDownForward:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c341.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,+140)];
            
        }
            break;
        case kstateFallingDownRight:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c261.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(140,0)];
            
        }
            break;
            
        case kstateFallingDownLeft:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c181.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(-140,0)];
            
        }
            break;
            
        case kstateFallingDownRightDiagnol:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c341.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,70)];
            
        }
            break;
            
        case kstateFallingDownLeftDiagnol:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c341.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,70)];
            ;
        }
            break;
            
        case kstateFallingDownBackwardLeftDiagnol:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c181.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,-70)];
          
        }
            break;
            
        case kstateFallingDownBackwardRightDiagnol:
        {
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"c261.png"]];
            //[self setPosition:ccp(self.position.x,self.position.y-100)];
            action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,-70)];
            
        }
            break;

        case KstateRunningRight:
            action =
            [CCAnimate actionWithAnimation:MR1];
            break;
        case KstateRunningLeft:
            action =
            [CCAnimate actionWithAnimation:ML1];
            break;
        case KstateRunningRightDiagnol:
            action =
            [CCAnimate actionWithAnimation:MRD1];
            break;
        case KstateRunningLeftDiagnol:
            action =
            [CCAnimate actionWithAnimation:MLD1];
            break;
        case KstateRunningForward:
            action =
            [CCAnimate actionWithAnimation:MF1];
            break;
        case KstateRunningBackward:
            action =
            [CCAnimate actionWithAnimation:MB1];
            break;
        case KstateRunningBackwardLeftDiagnol:
            action =
            [CCAnimate actionWithAnimation:MBLD1];
            break;
        case KstateRunningBackwardRightDiagnol:
            action =
            [CCAnimate actionWithAnimation:MBRD1];
            break;
        case kStateCelebrating:
            action =
            [CCAnimate actionWithAnimation:MC1];
            break;
            
        case kstateStandingRight:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1R3.png"]];

            break;
        case kstateStandingLeft:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1L3.png"]];
            
            break;
        case kstateStandingRightDiagnol:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1RD3.png"]];
            
            break;
        case kstateStandingLeftDiagnol:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1LD3.png"]];
            
            break;
        case kstateStandingForward:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1F3.png"]];
            
            break;
        case kstateStandingBackward:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1B3.png"]];
            
            break;
        case kstateStandingBackwardLeftDiagnol:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1BLD3.png"]];
            
            break;
        case kstateStandingBackwardRightDiagnol:
            [self setDisplayFrame:[[CCSpriteFrameCache
                                    sharedSpriteFrameCache]
                                   spriteFrameByName:@"player1BRD3.png"]];
            
            break;
            
            
            
    }
    
     }
    
    if(x==2)
    {
        
        switch (newState) {
            case kstateFallingDownBackward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c421.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,-140)];
                
            }
                break;
                
            case kstateFallingDownForward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,+140)];
                
            }
                break;
            case kstateFallingDownRight:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c261.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(140,0)];
                
            }
                break;
                
            case kstateFallingDownLeft:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c181.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-140,0)];
                
            }
                break;
                
            case kstateFallingDownRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,70)];
                
            }
                break;
                
            case kstateFallingDownLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,70)];
                ;
            }
                break;
                
            case kstateFallingDownBackwardLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c181.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,-70)];
                
            }
                break;
                
            case kstateFallingDownBackwardRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c261.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,-70)];
                
            }
                break;

            case KstateRunningRight:
                action =
                [CCAnimate actionWithAnimation:MR2];
                break;
            case KstateRunningLeft:
                action =
                [CCAnimate actionWithAnimation:ML2];
                break;
            case KstateRunningRightDiagnol:
                action =
                [CCAnimate actionWithAnimation:MRD2];
                break;
            case KstateRunningLeftDiagnol:
                action =
                [CCAnimate actionWithAnimation:MLD2];
                break;
            case KstateRunningForward:
                action =
                [CCAnimate actionWithAnimation:MF2];
                break;
            case KstateRunningBackward:
                action =
                [CCAnimate actionWithAnimation:MB2];
                break;
            case kStateCelebrating:
                action =
                [CCAnimate actionWithAnimation:MC2];
                break;
            case KstateRunningBackwardLeftDiagnol:
                action =
                [CCAnimate actionWithAnimation:MBLD2];
                break;
            case KstateRunningBackwardRightDiagnol:
                action =
                [CCAnimate actionWithAnimation:MBRD2];
                break;
            case kstateStandingRight:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2R3.png"]];
                
                break;
            case kstateStandingLeft:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2L3.png"]];
                
                break;
            case kstateStandingRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2RD3.png"]];
                
                break;
            case kstateStandingLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2LD3.png"]];
                
                break;
            case kstateStandingForward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2F3.png"]];
                
                break;
            case kstateStandingBackward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2B3.png"]];
                
                break;
            case kstateStandingBackwardLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2BLD3.png"]];
                
                break;
            case kstateStandingBackwardRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player2BRD3.png"]];
                
                break;

                
        }
        
    }

    if(x==3)
    {
        
        switch (newState) {
            case kstateFallingDownBackward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c421.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,-140)];
                
            }
                break;
                
            case kstateFallingDownForward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,+140)];
                
            }
                break;
            case kstateFallingDownRight:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c261.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(140,0)];
                
            }
                break;
                
            case kstateFallingDownLeft:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c181.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-140,0)];
                
            }
                break;
                
            case kstateFallingDownRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,70)];
                
            }
                break;
                
            case kstateFallingDownLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c341.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,70)];
                ;
            }
                break;
                
            case kstateFallingDownBackwardLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c181.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,-70)];
                
            }
                break;
                
            case kstateFallingDownBackwardRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"c261.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,-70)];
                
            }
                break;

                
            case KstateRunningRight:
                action =
                [CCAnimate actionWithAnimation:MR3];
                break;
            case KstateRunningLeft:
                action =
                [CCAnimate actionWithAnimation:ML3];
                break;
            case KstateRunningRightDiagnol:
                action =
                [CCAnimate actionWithAnimation:MRD3];
                break;
            case KstateRunningLeftDiagnol:
                action =
                [CCAnimate actionWithAnimation:MLD3];
                break;
            case kStateCelebrating:
                action =
                [CCAnimate actionWithAnimation:MC3];
                break;
            case KstateRunningForward:
                action =
                [CCAnimate actionWithAnimation:MF3];
                break;
            case KstateRunningBackward:
                action =
                [CCAnimate actionWithAnimation:MB3];
                break;
            case KstateRunningBackwardLeftDiagnol:
                action =
                [CCAnimate actionWithAnimation:MBLD3];
                break;
            case KstateRunningBackwardRightDiagnol:
                action =
                [CCAnimate actionWithAnimation:MBRD3];
                break;
            case kstateStandingRight:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3R3.png"]];
                
                break;
            case kstateStandingLeft:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3L3.png"]];
                
                break;
            case kstateStandingRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3RD3.png"]];
                
                break;
            case kstateStandingLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3LD3.png"]];
                
                break;
            case kstateStandingForward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3F3.png"]];
                
                break;
            case kstateStandingBackward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3B3.png"]];
                
                break;
            case kstateStandingBackwardLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3BLD3.png"]];
                
                break;
            case kstateStandingBackwardRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"player3BRD3.png"]];
                
                break;

        }
        
    }

    
    if((self.characterState==kstateFallingDownBackward)||(self.characterState==kstateFallingDownForward)||(self.characterState==kstateFallingDownRight)||(self.characterState==kstateFallingDownLeft)||(self.characterState==kstateFallingDownRightDiagnol)||(self.characterState==kstateFallingDownLeftDiagnol)||(self.characterState==kstateFallingDownBackwardRightDiagnol)||(self.characterState==kstateFallingDownBackwardLeftDiagnol))
    {
        [self runAction:action];
        
        return;
    }
    
    if (action != nil) {
        id repeatForever=[CCRepeatForever actionWithAction:action];
        [self runAction:repeatForever];
    }
    
}

-(void)stateChangeByDegrees:(float)degrees
{
    if(degrees<22.5||degrees>327.5)
    {
        //CCLOG(@"%@",self);
        //[super changeState:KstateRunningRight];
        //[self changeState:KstateRunningRight];
        if([self characterState]!=KstateRunningRight)
        {
            
            [self changeState:KstateRunningRight];
        }
    }
    else if(degrees<67.5&&degrees>22.5)
    {
        if([self characterState]!=KstateRunningRightDiagnol)
        {
            [self changeState:KstateRunningRightDiagnol];
        }
    }
    else if(degrees<112.5&&degrees>67.5)
    {
        if([self characterState]!=KstateRunningForward)
        {
            [self changeState:KstateRunningForward];
        }
    }
    else if(degrees<157.5&&degrees>112.5)
    {
        if([self characterState]!=KstateRunningLeftDiagnol)
        {
            [self changeState:KstateRunningLeftDiagnol];
        }
    }
    else if(degrees<202.5&&degrees>157.5)
    {
        if([self characterState]!=KstateRunningLeft)
        {
            [self changeState:KstateRunningLeft];
        }
    }
    else if(degrees<247.5&&degrees>202.5)
    {
        if([self characterState]!=KstateRunningBackwardLeftDiagnol)
        {
            [self changeState:KstateRunningBackwardLeftDiagnol];
        }
    }
    else if(degrees<292.5&&degrees>247.5)
    {
        if([self characterState]!=KstateRunningBackward)
        {
            [self changeState:KstateRunningBackward];
        }
    }
    else if(degrees<337.5&&degrees>292.5)
    {
        if([self characterState]!=KstateRunningBackwardRightDiagnol)
        {
            [self changeState:KstateRunningBackwardRightDiagnol];
        }
    }

}

-(void)stateChangeToStanding
{
    if([self characterState]==KstateRunningRight)
    {
        [self changeState:kstateStandingRight];
    }
    if([self characterState]==KstateRunningLeft)
    {
        [self changeState:kstateStandingLeft];
    }
    if([self characterState]==KstateRunningRightDiagnol)
    {
        [self changeState:kstateStandingRightDiagnol];
    }
    if([self characterState]==KstateRunningLeftDiagnol)
    {
        [self changeState:kstateStandingLeftDiagnol];
    }
    if([self characterState]==KstateRunningForward)
    {
        [self changeState:kstateStandingForward];
    }
    if([self characterState]==KstateRunningBackward)
    {
        [self changeState:kstateStandingBackward];
    }
    if([self characterState]==KstateRunningBackwardLeftDiagnol)
    {
        [self changeState:kstateStandingBackwardLeftDiagnol];
    }
    if([self characterState]==KstateRunningBackwardRightDiagnol)
    {
        [self changeState:kstateStandingBackwardRightDiagnol];
    }
    
}
#pragma mark -
-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects
{
    
    if(everythingHasEnded>0 &&everythingFinished)
    {
        
        everythingHasEnded+=deltaTime;
        CCLOG(@"%f",everythingHasEnded);
        if(everythingHasEnded>3)
        {
            everythingFinished=NO;
            [[GameManager sharedGameManager]runSceneWithID:kMainMenuScene];
            return;
        }
        //return;
    }
    
    
    [self checkAndClampSpritePosition];
    if([self hasBall])
    {
       // CCLOG(@"%f, %f",self.position.x,self.position.y);
    }
    
    background=(GameCharacter*)[[[self parent]parent] getChildByTag:kBackgroundImageTagValue];
    
    CharacterStates backgroundState;
    backgroundState=[background characterState];
    if(backgroundState==kStateBackgroundNotMovingRight)
    {
        if([self hasBall]&&self.position.x>screenSize.width*0.9)
        {
            gameHasLost=YES;
            milliSecondsStayingFallingDown=0;
            milliSecondsToReachTheStart=0;
            [[GameManager sharedGameManager]runSceneWithID:kBetweenLevelsScene];
            return;
        }
    }
    
    if(backgroundState==kStateBackgroundNotMovingLeft)
    {
        if([self hasBall]&&self.position.x<screenSize.width*0.1)
        {
            gameHasLost=YES;
            milliSecondsStayingFallingDown=0;
            milliSecondsToReachTheStart=0;
            [[GameManager sharedGameManager]runSceneWithID:kBetweenLevelsScene];
            return;
        }
    }
    
    if (gameHasLost&&[self hasBall]) {
        milliSecondsStayingFallingDown+=deltaTime;
        /*
        if(self.characterState!=kstateFallingDownBackward)
        {
            self.characterState=kstateFallingDownBackward;
            [self changeState:kstateFallingDownBackward];
        }
        */
        if(milliSecondsStayingFallingDown>1.3)
        {
            milliSecondsStayingFallingDown=0;
            milliSecondsToReachTheStart=0;
        [[GameManager sharedGameManager]runSceneWithID:kBetweenLevelsScene];
        }
        return;
    }
    
    
    
    if(gameHasStarted==NO&&[self hasBall]==YES)
    {
        if(joystick.velocity.x!=0||joystick.velocity.y!=0)
        {
        gameHasStarted=YES;
        }
        
        /*
        //CGSize size1=[CCDirector sharedDirector].winSize;
        CGSize size2=[CCDirector sharedDirector].winSizeInPixels;
        
        
    //CGRect rect=CGRectMake(220,160,80,80);
        CGRect rect=CGRectMake(screenSize.width/2-(170*size2.width/2/1024),screenSize.height/2.5-(190*size2.height/2/768) , 170*size2.width/1024, 190*size2.height/768);
        
    if(milliSecondsToReachTheStart>3)
    {
        
        
        if(CGRectIntersectsRect(rect, [self adjustedBoundingBox]))
        {
            gameHasStarted=YES;
            
            
            
        }
        else
        {
            gameHasLost=YES;
            milliSecondsToReachTheStart=0;
            //CCLOG(@"%f",milliSecondsToReachTheStart);
            [[GameManager sharedGameManager]runSceneWithID:kBetweenLevelsScene];
         
        }
    }
         */
    }

    
    
    if(gameHasWon&&[self characterState]!=kStateCelebrating)
    {
        if([self hasBall]==YES)
        {
        if(levelNumber==4)
        {
            levelNumber=1;
            if(numberStage==9)
            {
                everythingFinished=YES;
            }
            else
            {
            numberStage++;
            }
            //NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"7", nil];
            
            
            //NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"AHSAN",@"1",@"SAEED",@"2", nil];
            if(numberStage>numberStageFromPlist)
            {
            NSString *fullFileName = [NSString stringWithFormat:@"%@.plist",@"StageVariable"];
            NSString *plistPath;
            
            NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            plistPath =[rootPath stringByAppendingPathComponent:fullFileName];
            if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
            {
                plistPath = [[NSBundle mainBundle] pathForResource:@"StageVariable" ofType:@"plist"];
                
            }
            
            NSMutableDictionary *data=[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath];
            [data setObject:[NSNumber numberWithInt:numberStage] forKey:@"StageNumber"];
            [data writeToFile:plistPath atomically:YES];
            
            //[dict writeToFile:plistPath atomically:YES];
            NSLog(@"................>>>>>>>>>>>>>\n%@",plistPath);
            }
            
             
            
        }
        else
        {
        levelNumber++;
        }
            milliSecondsStayingCelebrating=0;
        }
        
        [self changeState:kStateCelebrating];
        
        return;
    }
    
    if([self hasBall]==YES&&[self characterState]==kStateCelebrating)
    {
        milliSecondsStayingCelebrating+=deltaTime;
        milliSecondsToReachTheStart=0;
        
        if(milliSecondsStayingCelebrating>2.5)
        {
            if(everythingFinished&&everythingHasEnded==0)
            {
                CCNode *layer=[[self parent]parent];
                CCLOG(@"%@",layer);
                //CCSprite *start=[[CCSprite alloc]initWithFile:@"Box1.png"];
                //start.position=CGPointMake(260, 200);
                //[self addChild:start];
                CCSprite *Victory=[[CCSprite alloc]initWithFile:@"Victory.png"];
                Victory.position=CGPointMake(screenSize.width/2, screenSize.height/2);
                [layer addChild:Victory z:120];
                //everythingFinished=YES;
                
                

                everythingHasEnded=deltaTime;
            }
            else if(everythingFinished==NO || everythingHasEnded==0)
            {
                [[GameManager sharedGameManager]runSceneWithID:kBetweenLevelsScene];
            }
            milliSecondsStayingCelebrating=0;
        }
    }
    
    
    
    if(gameHasWon)
    {
        return;
    }
    
    if(hasBall)
    {
       
           
    for (GameCharacter *character in listOfGameObjects)
    {
        
if(gameHasLost==NO)
{
        CGRect characterBox = [character boundingBox];
        if (CGRectIntersectsRect([self boundingBox], characterBox))
        {
            if(character.tag==playerHasBall)
            {
                
            }
            
              else if ([character gameObjectType] == kOpponent)
              {
                  CCLOG(@"game has ended");
                  
                  if(character.characterState==KstateRunningBackward)
                  {
                  character.characterState=kstateFallingDownBackward;
                 [character changeState:kstateFallingDownBackward];
                      self.characterState=kstateFallingDownBackward;
                      [self changeState:kstateFallingDownBackward];
                  }
                  
                  if(character.characterState==KstateRunningForward)
                  {
                      character.characterState=kstateFallingDownForward;
                      [character changeState:kstateFallingDownForward];
                      self.characterState=kstateFallingDownForward;
                      [self changeState:kstateFallingDownForward];
                  }
                  
                  if(character.characterState==KstateRunningLeft)
                  {
                      character.characterState=kstateFallingDownLeft;
                      [character changeState:kstateFallingDownLeft];
                      self.characterState=kstateFallingDownLeft;
                      [self changeState:kstateFallingDownLeft];
                  }
                  
                  if(character.characterState==KstateRunningRight)
                  {
                      character.characterState=kstateFallingDownRight;
                      [character changeState:kstateFallingDownRight];
                      self.characterState=kstateFallingDownRight;
                      [self changeState:kstateFallingDownRight];
                  }
                  
                  if(character.characterState==KstateRunningRightDiagnol)
                  {
                      character.characterState=kstateFallingDownRightDiagnol;
                      [character changeState:kstateFallingDownRightDiagnol];
                      self.characterState=kstateFallingDownRightDiagnol;
                      [self changeState:kstateFallingDownRightDiagnol];
                  }
                  
                  if(character.characterState==KstateRunningLeftDiagnol)
                  {
                      character.characterState=kstateFallingDownLeftDiagnol;
                      [character changeState:kstateFallingDownLeftDiagnol];
                      self.characterState=kstateFallingDownLeftDiagnol;
                      [self changeState:kstateFallingDownLeftDiagnol];
                  }
                  
                  if(character.characterState==KstateRunningBackwardLeftDiagnol)
                  {
                      character.characterState=kstateFallingDownBackwardLeftDiagnol;
                      [character changeState:kstateFallingDownBackwardLeftDiagnol];
                      self.characterState=kstateFallingDownBackwardLeftDiagnol;
                      [self changeState:kstateFallingDownBackwardLeftDiagnol];
                  }
                  
                  if(character.characterState==KstateRunningBackwardRightDiagnol)
                  {
                      character.characterState=kstateFallingDownBackwardRightDiagnol;
                      [character changeState:kstateFallingDownBackwardRightDiagnol];
                      self.characterState=kstateFallingDownBackwardRightDiagnol;
                      [self changeState:kstateFallingDownBackwardRightDiagnol];
                  }
                  
                  
                  //[character changeState:kstateFallingDownBackward];
                  gameHasLost=YES;
                  milliSecondsToReachTheStart=0;
                  return;

              }
              
        }
}
    }
    }
    

    
    if(self.characterState==kStateReceiving)
    {
        CCLOG(@"%f",milliSecondsStayingReceving);
        milliSecondsStayingReceving=milliSecondsStayingReceving+deltaTime;
        if(milliSecondsStayingReceving>0.6f)
        {
            self.characterState=kStateNone;
        }
        return;
    }
  /*
    if(hasBall)
    {
        [pointer setDisplayFrame:[[CCSpriteFrameCache
                                   sharedSpriteFrameCache]
                                  spriteFrameByName:@"Ball.png"]];
        CGPoint pointerPosition=[self position];
        
        pointerPosition.y+=screenSize.width/11;
        pointer.position=pointerPosition;
        
        
        //CCLOG(@"%@",batch);
        //CCLOG(@"asd");
        if(pointerAdded==1)
        {
            pointerAdded=2;
            CCNode *batch=[[self parent]parent];
            [batch addChild:pointer z:50];
            
        }
    
    }
   
    else
    {
        
        [pointer setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"empty.png"]];
        
        
         
        CGPoint pointerPosition=[self position];
        
        pointerPosition.y+=screenSize.width/11;
        pointer.position=pointerPosition;
        
        
        //CCLOG(@"%@",batch);
        //CCLOG(@"asd");
        if(pointerAdded==1)
        {
            pointerAdded=2;
            CCNode *batch=[[self parent]parent];
            [batch addChild:pointer z:50];
        }
        
    }
   */
    if(!hasBall)
    {
        if(playerHasBall==1)
        {
            playerHavingBallRightNow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            
        }
        if(playerHasBall==2)
        {
            playerHavingBallRightNow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
            
        }
        if(playerHasBall==3)
        {
            playerHavingBallRightNow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
            
        }
        
        CGPoint position=[playerHavingBallRightNow position];
        CGPoint selfPosition=[self position];
        //CGRect rect=CGRectMake(position.x-10.5, position.y-21, 21, 42);
        //if(CGRectIntersectsRect(rect, [self adjustedBoundingBox]))
        
        CGPoint myDesiredPosition;
        
        if([background characterState]!=kStateBackgroundNotMovingLeft&&[background characterState]!=kStateBackgroundNotMovingRight)
        {
            
        myDesiredPosition=CGPointMake(position.x+(screenSize.width/3.7*([playerHavingBallRightNow desiredLocation]-[self desiredLocation])), position.y);
        }
        
        else
        {
        GameCharacter *firstPlayerToFollow,*secondPlayerToFollow;
        if([self tag]==kOurPlayer1TagValue)
        {
            firstPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
            secondPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        if([self tag]==kOurPlayer2TagValue)
        {
            firstPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            secondPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        if([self tag]==kOurPlayer3TagValue)
        {
            firstPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            secondPlayerToFollow=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        }
        
        myDesiredPosition=CGPointMake( position.x+(screenSize.width/3.7*([playerHavingBallRightNow desiredLocation]-desiredLocation)),position.y);
        
        if([self desiredLocation]==1)
        {
            if([firstPlayerToFollow desiredLocation]==2)
            {
                myDesiredPosition=CGPointMake([firstPlayerToFollow position].x+screenSize.width/3.7,[firstPlayerToFollow position].y );
            }
            if([secondPlayerToFollow desiredLocation]==2)
            {
                myDesiredPosition=CGPointMake([secondPlayerToFollow position].x+screenSize.width/3.7,[secondPlayerToFollow position].y );
            }
        }
        
        if([self desiredLocation]==2)
        {
            if([firstPlayerToFollow desiredLocation]==1)
            {
                myDesiredPosition=CGPointMake([firstPlayerToFollow position].x-screenSize.width/3.7,[firstPlayerToFollow position].y );
            }
            if([secondPlayerToFollow desiredLocation]==1)
            {
                myDesiredPosition=CGPointMake([secondPlayerToFollow position].x-screenSize.width/3.7,[secondPlayerToFollow position].y );
            }
        }
        
        if([self desiredLocation]==3)
        {
            if([firstPlayerToFollow desiredLocation]==2)
            {
                myDesiredPosition=CGPointMake([firstPlayerToFollow position].x-screenSize.width/3.7,[firstPlayerToFollow position].y );
            }
            if([secondPlayerToFollow desiredLocation]==2)
            {
                myDesiredPosition=CGPointMake([secondPlayerToFollow position].x-screenSize.width/3.7,[secondPlayerToFollow position].y );
            }
        }
        }
        /*
        if(self.tag==kOurPlayer1TagValue)
        {
        myDesiredPosition=CGPointMake(position.x+(130*desiredLocation1), position.y);
        }
        
        if(self.tag==kOurPlayer2TagValue)
        {
            myDesiredPosition=CGPointMake(position.x+(130*desiredLocation1), position.y);
        }
         
        if(self.tag==kOurPlayer3TagValue)
        {
            myDesiredPosition=CGPointMake(position.x+(130*desiredLocation3), position.y);
        }
         */
        //[self setPosition:myNewPosition];
        CGPoint newPosition=myDesiredPosition;
        
        int xMove,yMove;
        
        if(myDesiredPosition.x>(selfPosition.x+screenSize.width/160))
        {
            newPosition.x=[self position].x+screenSize.width/160;
            xMove=screenSize.width/160;
        }
        else if(myDesiredPosition.x<(selfPosition.x-screenSize.width/160))
        {
            newPosition.x=[self position].x-screenSize.width/160;
            xMove=-screenSize.width/160;
        }
        else
        {
            
            xMove=myDesiredPosition.x-[self position].x;
            newPosition.x=myDesiredPosition.x;
            
        }
        
        
        if(myDesiredPosition.y>(selfPosition.y+screenSize.height/103))
        {
            newPosition.y=[self position].y+screenSize.height/103;
            yMove=screenSize.width/103;
        }
        else if(myDesiredPosition.y<(selfPosition.y-screenSize.                                   height/103))
        {
            newPosition.y=[self position].y-screenSize.height/103;
            yMove=-screenSize.width/103;
        }
        else
        {
            yMove=myDesiredPosition.y-[self position].y;
            newPosition.y=myDesiredPosition.y;
        }
        
        
        [self setPosition:newPosition];
        
        if([background characterState]==kStateBackgroundNotMovingRight||[background characterState]==kStateBackgroundNotMovingLeft)
        {
            if(joystick.degrees>0&&joystick.degrees<180)
            {
                [self stateChangeByDegrees:joystick.degrees];
            }
            else if(joystick.degrees>180&&joystick.degrees<360)
            {
                [self stateChangeByDegrees:joystick.degrees];
            }
            else
            {
                if(xMove==0)
                {
                [self stateChangeToStanding];
                }
                else if(xMove>0)
                {
                    [self stateChangeByDegrees:0];
                }
                else
                {
                    [self stateChangeByDegrees:180];
                }
            }
        }
        else
        {
        if(xMove>0&&yMove>0)
        {
            [self stateChangeByDegrees:45];
        }
        else if(xMove>0&&yMove<0)
        {
            [self stateChangeByDegrees:-315];
        }
        else if(xMove<0&&yMove>0)
        {
            [self stateChangeByDegrees:135];
        }
        else if(xMove<0&&yMove<0)
        {
            [self stateChangeByDegrees:225];
        }
        else if (xMove==0&&yMove>0)
        {
            [self stateChangeByDegrees:90];
        }
        else if (xMove==0&&yMove<0)
        {
            [self stateChangeByDegrees:270];
        }
        else if (xMove>0&&yMove==0)
        {
            [self stateChangeByDegrees:0];
        }
        else if (xMove<0&&yMove==0)
        {
            [self stateChangeByDegrees:180];
        }
        else if(xMove==0&&yMove==0)
        {
            background=(GameCharacter*)[[[self parent]parent] getChildByTag:kBackgroundImageTagValue];
            
            CharacterStates backgroundState;
            backgroundState=[background characterState];
            
            CGPoint x=joystick.velocity;
            if(backgroundState==kStateBackgroundMoving&&(x.x!=0||x.y!=0))
            {
                
                [self stateChangeByDegrees:joystick.degrees];
            }
            else
            {
            [self stateChangeToStanding];
            }
        }

        }
    }
    
    if((joystick.velocity.x!=0||joystick.velocity.y!=0)&&hasBall==true)
    {
    
    //[self changeState:kStateIdle];
        //CCLOG(@"come here if joystick moves");
        [self stateChangeByDegrees:joystick.degrees];
        
        [self applyJoystick:joystick
               forTimeDelta:deltaTime];
    }
    
    if(joystick.velocity.x==0&&joystick.velocity.y==0&&[self characterState]!=kStateNone&&hasBall==true)
    {
        [self stateChangeToStanding];
    }
 
    
    if(passButton.active==YES&&self.hasBall==true&&self.characterState!=kStateReceiving)
    {
        CCLOG(@"Pass ball to the right");
        
        GameCharacter *players1,*players2;
        if(playerHasBall==1)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        else if (playerHasBall==2)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        else if(playerHasBall==3)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        }
        GameCharacter *ball=(GameCharacter*)[[self parent]getChildByTag:kBallTagValue];
        
        if(players1.position.x>self.position.x&&players2.position.x<self.position.x)
        {
            players1.hasBall=true;
            
            players1.characterState=kstateStandingLeft;
            [players1 changeState:kstateStandingLeft];
            self.characterState=kstateStandingRight;
            [self changeState:kstateStandingRight];
            
            players1.characterState=kStateReceiving;
            playerHasBall=players1.tag;
            [ball moveBallFrom:self.position to:players1.position];
            self.hasBall=false;
            
        }
        
        else if(players2.position.x>self.position.x&&players1.position.x<self.position.x)
        {
            players2.characterState=kstateStandingLeft;
            [players2 changeState:kstateStandingLeft];
            self.characterState=kstateStandingRight;
            [self changeState:kstateStandingRight];
            
            
            players2.hasBall=true;
            players2.characterState=kStateReceiving;
            playerHasBall=players2.tag;
            [ball moveBallFrom:self.position to:players2.position];
            self.hasBall=false;
        }
        
        
        else if(players1.position.x>self.position.x&&players1.position.x<players2.position.x)
        {
            players1.characterState=kstateStandingLeft;
            [players1 changeState:kstateStandingLeft];
            self.characterState=kstateStandingRight;
            [self changeState:kstateStandingRight];
            
            
            players1.hasBall=true;
            players1.characterState=kStateReceiving;
            playerHasBall=players1.tag;
            [ball moveBallFrom:self.position to:players1.position];
            self.hasBall=false;

        }
        else if(players1.position.x>self.position.x&&players1.position.x>players2.position.x)
        {
            players2.characterState=kstateStandingLeft;
            [players2 changeState:kstateStandingLeft];
            self.characterState=kstateStandingRight;
            [self changeState:kstateStandingRight];
            
            
            players2.hasBall=true;
            players2.characterState=kStateReceiving;
            playerHasBall=players2.tag;
            [ball moveBallFrom:self.position to:players2.position];
            self.hasBall=false;
        }
        
        milliSecondsStayingReceving=0;
        
    }
    

    if(passButton2.active==YES&&self.hasBall==true&&self.characterState!=kStateReceiving)
    {
        
        CCLOG(@"Pass ball to the left");
        
        GameCharacter *players1,*players2;
        if(playerHasBall==1)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        else if (playerHasBall==2)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        }
        else if(playerHasBall==3)
        {
            players1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
            players2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        }
        GameCharacter *ball=(GameCharacter*)[[self parent]getChildByTag:kBallTagValue];
        
        if(players1.position.x<self.position.x&&players2.position.x>self.position.x)
        {
            players1.characterState=kstateStandingRight;
            [players1 changeState:kstateStandingRight];
            self.characterState=kstateStandingLeft;
            [self changeState:kstateStandingLeft];
            
            players1.hasBall=true;
            players1.characterState=kStateReceiving;
            playerHasBall=players1.tag;
            [ball moveBallFrom:self.position to:players1.position];
            self.hasBall=false;
        }
        
        else if(players2.position.x<self.position.x&&players1.position.x>self.position.x)
        {
            players2.characterState=kstateStandingRight;
            [players2 changeState:kstateStandingRight];
            self.characterState=kstateStandingLeft;
            [self changeState:kstateStandingLeft];
            
            players2.hasBall=true;
            players2.characterState=kStateReceiving;
            playerHasBall=players2.tag;
            [ball moveBallFrom:self.position to:players2.position];
            self.hasBall=false;
        }
        
        
        else if(players1.position.x<self.position.x&&players1.position.x>players2.position.x)
        {
            players1.characterState=kstateStandingRight;
            [players1 changeState:kstateStandingRight];
            self.characterState=kstateStandingLeft;
            [self changeState:kstateStandingLeft];
            
            players1.hasBall=true;
            players1.characterState=kStateReceiving;
            playerHasBall=players1.tag;
            [ball moveBallFrom:self.position to:players1.position];
            self.hasBall=false;
            
        }
        else if(players1.position.x<self.position.x&&players1.position.x<players2.position.x)
        {
            players2.characterState=kstateStandingRight;
            [players2 changeState:kstateStandingRight];
            self.characterState=kstateStandingLeft;
            [self changeState:kstateStandingLeft];
            
            players2.hasBall=true;
            players2.characterState=kStateReceiving;
            playerHasBall=players2.tag;
            [ball moveBallFrom:self.position to:players2.position];
            self.hasBall=false;
        }
        
        
        milliSecondsStayingReceving=0;
    }
        
    
}




#pragma mark -
-(void)initAnimations {

    CCLOG(@"initializing animations");
    
    
    //CELEBRATING ANIMATIONS
        [self setMC1:[self loadPlistForAnimationWithName:@"MC1" andClassName:NSStringFromClass([self class])]];
        [self setMC2:[self loadPlistForAnimationWithName:@"MC2" andClassName:NSStringFromClass([self class])]];
        [self setMC3:[self loadPlistForAnimationWithName:@"MC3" andClassName:NSStringFromClass([self class])]];
    
    [self setML1:[self loadPlistForAnimationWithName:@"ML1" andClassName:NSStringFromClass([self class])]];
    [self setMR1:[self loadPlistForAnimationWithName:@"MR1" andClassName:NSStringFromClass([self class])]];
    [self setMLD1:[self loadPlistForAnimationWithName:@"MLD1" andClassName:NSStringFromClass([self class])]];
    [self setMRD1:[self loadPlistForAnimationWithName:@"MRD1" andClassName:NSStringFromClass([self class])]];
    [self setMBLD1:[self loadPlistForAnimationWithName:@"MBLD1" andClassName:NSStringFromClass([self class])]];
    [self setMBRD1:[self loadPlistForAnimationWithName:@"MBRD1" andClassName:NSStringFromClass([self class])]];

    
    
    [self setML2:[self loadPlistForAnimationWithName:@"ML2" andClassName:NSStringFromClass([self class])]];
    [self setMR2:[self loadPlistForAnimationWithName:@"MR2" andClassName:NSStringFromClass([self class])]];
    [self setMLD2:[self loadPlistForAnimationWithName:@"MLD2" andClassName:NSStringFromClass([self class])]];
    [self setMRD2:[self loadPlistForAnimationWithName:@"MRD2" andClassName:NSStringFromClass([self class])]];
    [self setMBLD2:[self loadPlistForAnimationWithName:@"MBLD2" andClassName:NSStringFromClass([self class])]];
    [self setMBRD2:[self loadPlistForAnimationWithName:@"MBRD2" andClassName:NSStringFromClass([self class])]];
    
    
    [self setML3:[self loadPlistForAnimationWithName:@"ML3" andClassName:NSStringFromClass([self class])]];
    [self setMR3:[self loadPlistForAnimationWithName:@"MR3" andClassName:NSStringFromClass([self class])]];
    [self setMLD3:[self loadPlistForAnimationWithName:@"MLD3" andClassName:NSStringFromClass([self class])]];
    [self setMRD3:[self loadPlistForAnimationWithName:@"MRD3" andClassName:NSStringFromClass([self class])]];
    [self setMBLD3:[self loadPlistForAnimationWithName:@"MBLD3" andClassName:NSStringFromClass([self class])]];
    [self setMBRD3:[self loadPlistForAnimationWithName:@"MBRD3" andClassName:NSStringFromClass([self class])]];

    [self setMF1:[self loadPlistForAnimationWithName:@"MF1" andClassName:NSStringFromClass([self class])]];
    [self setMF2:[self loadPlistForAnimationWithName:@"MF2" andClassName:NSStringFromClass([self class])]];
    [self setMF3:[self loadPlistForAnimationWithName:@"MF3" andClassName:NSStringFromClass([self class])]];
    [self setMB1:[self loadPlistForAnimationWithName:@"MB1" andClassName:NSStringFromClass([self class])]];
    [self setMB2:[self loadPlistForAnimationWithName:@"MB2" andClassName:NSStringFromClass([self class])]];
    [self setMB3:[self loadPlistForAnimationWithName:@"MB3" andClassName:NSStringFromClass([self class])]];

    CCLOG(@"animations have been initialized");
    
}

-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        CCLOG(@"Player initialized");
        screenSize = [CCDirector sharedDirector].winSize;

        //gameHasStarted=NO;
        joystick=nil;
        passButton = nil;
        passButton2=nil;
        
                             
        self.characterState=kStateNone;
       
        
        [self initAnimations];
         //[self changeState:KstateRunningRight];
        //pointer=[CCSprite spriteWithFile:@"Ball.png"];
        
        //pointer=[[CCSprite alloc]initWithFile:@"Ball.png"];
        

        
        //pointer2=[[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"Icon-Small.png"]];

        pointerAdded=1;
        
//        [CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"Ball.png"]];

        
           pointer=[[CCSprite alloc] initWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache]spriteFrameByName:@"Ball.png"]]; 
        
        //milliSecondsStayingReceving=1.0f;

        everythingFinished=NO;
        everythingHasEnded=0;
    
    }
    return self;
}

@end
