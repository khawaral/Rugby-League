//
//  BackgroundImage.m
//  RugbyLeague
//
//  Created by khawar ali on 1/12/13.
//
//

#import "BackgroundImage.h"

@implementation BackgroundImage

@synthesize joystick;
@synthesize passButton ;
//@synthesize gameHasStarted;

-(void)applyJoystick:(SneakyJoystick *)aJoystick forTimeDelta:(float)deltaTime
{
    if(characterState==kStateBackgroundStarting)
    {
        characterState=kStateBackgroundMoving;
    }
    
    if(([self characterState]==kStateBackgroundMoving)||([self characterState]==kStateBackgroundNotMovingBackward)||([self characterState]==kStateBackgroundNotMovingForward)||([self characterState]==kStateBackgroundNotMovingLeft)||([self characterState]==kStateBackgroundNotMovingRight))
    {
        //CCLOG(@"%x from bg",characterState);
        //set velocity's right speed here
//    CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 128.0f);
        
        
       // CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 200.0f);
        
        
        float x=pow(screenSize.height, 2)+pow(screenSize.width, 2);
        x=pow(x, 0.5);
        CGPoint scaledVelocity = ccpMult(aJoystick.velocity, x/3);

    CGPoint oldPosition = [self position];
    CGPoint newPosition =
    ccp(oldPosition.x -
        scaledVelocity.x * deltaTime,
        oldPosition.y-scaledVelocity.y*deltaTime);
        
       // CCLOG(@"%f",scaledVelocity.x*deltaTime);
        //CCLOG(@"%f",scaledVelocity.y*deltaTime);

        if(newPosition.x<=-(screenSize.width/5.3))
        {
            characterState=kStateBackgroundNotMovingRight;
            newPosition.x=oldPosition.x;
            
            if(newPosition.y<=-(screenSize.height)*1.624)
            {
                characterState=kStateBackgroundNotMovingForward;
                newPosition=oldPosition;
            }
            
            if(newPosition.y>=(screenSize.height)*2.623)
            {
                characterState=kStateBackgroundNotMovingBackward;
                newPosition=oldPosition;
            }
            

            //player having ball is already at the right most
            if((playerHasBall==1&&ourPlayer1.desiredLocation==1)||(playerHasBall==2&&ourPlayer2.desiredLocation==1)||(playerHasBall==3&&ourPlayer3.desiredLocation==1))
            {
                
            }
            //if player at 2 or 3 has the ball
            else
            {
            
            //if first player has ball&&is at center then switch center and right location players
                /*
            if(ourPlayer1.hasBall&&ourPlayer1.desiredLocation==2)
            {
                ourPlayer1.desiredLocation=1;
                
                if(ourPlayer2.desiredLocation==1)
                {
                    ourPlayer2.desiredLocation=2;
                }
                else if (ourPlayer3.desiredLocation==1)
                {
                    ourPlayer3.desiredLocation=2;
                }
            }
                 */
                //if first player has ball&&is at left then switch center and left location players
            if(ourPlayer1.hasBall&&ourPlayer1.desiredLocation==3)
            {
                ourPlayer1.desiredLocation=2;
                
                if(ourPlayer2.desiredLocation==2)
                {
                    ourPlayer2.desiredLocation=3;
                }
                else if (ourPlayer3.desiredLocation==2)
                {
                    ourPlayer3.desiredLocation=3;
                }
            }
                
                //if second player has ball&&is at center then switch center and right location players
                /*
                if(ourPlayer2.hasBall&&ourPlayer2.desiredLocation==2)
                {
                    ourPlayer2.desiredLocation=1;
                    
                    if(ourPlayer1.desiredLocation==1)
                    {
                        ourPlayer1.desiredLocation=2;
                    }
                    else if (ourPlayer3.desiredLocation==1)
                    {
                        ourPlayer3.desiredLocation=2;
                    }
                }
                 */
                //if second player has ball&&is at left then switch center and left location players
                if(ourPlayer2.hasBall&&ourPlayer2.desiredLocation==3)
                {
                    ourPlayer2.desiredLocation=2;
                    
                    if(ourPlayer1.desiredLocation==2)
                    {
                        ourPlayer1.desiredLocation=3;
                    }
                    else if (ourPlayer3.desiredLocation==2)
                    {
                        ourPlayer3.desiredLocation=3;
                    }
                }
                
                //if third player has ball&&is at center then switch center and right location players
                /*
                if(ourPlayer3.hasBall&&ourPlayer3.desiredLocation==2)
                {
                    ourPlayer3.desiredLocation=1;
                    
                    if(ourPlayer1.desiredLocation==1)
                    {
                        ourPlayer1.desiredLocation=2;
                    }
                    else if (ourPlayer2.desiredLocation==1)
                    {
                        ourPlayer2.desiredLocation=2;
                    }
                }
                 */
                //if third player has ball&&is at left then switch center and left location players
                else if(ourPlayer3.hasBall&&ourPlayer3.desiredLocation==3)
                {
                    ourPlayer3.desiredLocation=2;
                    
                    if(ourPlayer1.desiredLocation==2)
                    {
                        ourPlayer1.desiredLocation=3;
                    }
                    else if (ourPlayer2.desiredLocation==2)
                    {
                        ourPlayer2.desiredLocation=3;
                    }
                }
                
                
            }
            
         }
            
        
        
        else if(newPosition.x>=(screenSize.width*1.1875))
        {
            characterState=kStateBackgroundNotMovingLeft;
            newPosition.x=oldPosition.x;
            
            if(newPosition.y<=-(screenSize.height)*1.624)
            {
                characterState=kStateBackgroundNotMovingForward;
                newPosition=oldPosition;
            }
            
            if(newPosition.y>=(screenSize.height)*2.623)
            {
                characterState=kStateBackgroundNotMovingBackward;
                newPosition=oldPosition;
            }
            

            
            if((playerHasBall==1&&ourPlayer1.desiredLocation==3)||(playerHasBall==2&&ourPlayer2.desiredLocation==3)||(playerHasBall==3&&ourPlayer3.desiredLocation==3))
            {
                
            }
            //if player at 2 or 3 has the ball
            else
            {
                
                //if first player has ball&&is at center then switch center and right location players
                /*
                if(ourPlayer1.hasBall&&ourPlayer1.desiredLocation==2)
                {
                    ourPlayer1.desiredLocation=1;
                    
                    if(ourPlayer2.desiredLocation==1)
                    {
                        ourPlayer2.desiredLocation=2;
                    }
                    else if (ourPlayer3.desiredLocation==1)
                    {
                        ourPlayer3.desiredLocation=2;
                    }
                }
                 */
                //if first player has ball&&is at left then switch center and left location players
                if(ourPlayer1.hasBall&&ourPlayer1.desiredLocation==1)
                {
                    ourPlayer1.desiredLocation=2;
                    
                    if(ourPlayer2.desiredLocation==2)
                    {
                        ourPlayer2.desiredLocation=1;
                    }
                    else if (ourPlayer3.desiredLocation==2)
                    {
                        ourPlayer3.desiredLocation=1;
                    }
                }
                
                //if second player has ball&&is at center then switch center and right location players
                /*
                if(ourPlayer2.hasBall&&ourPlayer2.desiredLocation==2)
                {
                    ourPlayer2.desiredLocation=1;
                    
                    if(ourPlayer1.desiredLocation==1)
                    {
                        ourPlayer1.desiredLocation=2;
                    }
                    else if (ourPlayer3.desiredLocation==1)
                    {
                        ourPlayer3.desiredLocation=2;
                    }
                }
                 */
                //if second player has ball&&is at left then switch center and left location players
                if(ourPlayer2.hasBall&&ourPlayer2.desiredLocation==1)
                {
                    ourPlayer2.desiredLocation=2;
                    
                    if(ourPlayer1.desiredLocation==2)
                    {
                        ourPlayer1.desiredLocation=1;
                    }
                    else if (ourPlayer3.desiredLocation==2)
                    {
                        ourPlayer3.desiredLocation=1;
                    }
                }
                
                //if third player has ball&&is at center then switch center and right location players
                /*
                if(ourPlayer3.hasBall&&ourPlayer3.desiredLocation==2)
                {
                    ourPlayer3.desiredLocation=1;
                    
                    if(ourPlayer1.desiredLocation==1)
                    {
                        ourPlayer1.desiredLocation=2;
                    }
                    else if (ourPlayer2.desiredLocation==1)
                    {
                        ourPlayer2.desiredLocation=2;
                    }
                }
                 */
                //if third player has ball&&is at left then switch center and left location players
                else if(ourPlayer3.hasBall&&ourPlayer3.desiredLocation==1)
                {
                    ourPlayer3.desiredLocation=2;
                    
                    if(ourPlayer1.desiredLocation==2)
                    {
                        ourPlayer1.desiredLocation=1;
                    }
                    else if (ourPlayer2.desiredLocation==2)
                    {
                        ourPlayer2.desiredLocation=1;
                    }
                }
                
                
            }

        }
        
        else if(newPosition.y>=(screenSize.height)*2.623)
        {
            characterState=kStateBackgroundNotMovingBackward;
            newPosition=oldPosition;
        }
        
        else if(newPosition.y<=-(screenSize.height)*1.624)
        {
            characterState=kStateBackgroundNotMovingForward;
            newPosition=oldPosition;
        }
        else if(characterState!=kStateBackgroundMoving)
        {
            forCheckingTheStates=1;
            characterState=kStateBackgroundMoving;
        }
        
        
            [self setPosition:newPosition];
        
    }
    
}

-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray*)listOfGameObjects
{
    if(gameHasStarted==YES)
    {
        ourPlayer1=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
        
        ourPlayer2=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        ourPlayer3=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        //CCLOG(@"%@",[self parent]);
        
        CCNode *a=[self parent];
        CCNode *b=[a getChildByTag:kBatchNodeTagValue];
        
        
        ourPlayer1=(GameCharacter*)[b getChildByTag:kOurPlayer1TagValue];
        
        ourPlayer2=(GameCharacter*)[b getChildByTag:kOurPlayer2TagValue];
        ourPlayer3=(GameCharacter*)[b getChildByTag:kOurPlayer3TagValue];
       // CCLOG(@"%@",a);
        //CCLOG(@"%@",b);
        
        
        
    if((joystick.velocity.x!=0||joystick.velocity.y!=0))
    {
        [self applyJoystick:joystick
               forTimeDelta:deltaTime];
    }
    }
    
    
}


-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        CCLOG(@"Background Image initialized");
        
        //[self setPosition:
       //  CGPointMake(screenSize.height/2, screenSize.width*3.5)]; // 5
        gameHasStarted=NO;
        joystick=nil;
        passButton = nil;
        
        self.gameObjectType = kBackground;
        self.characterState=kStateBackgroundStarting;
        
        screenSize = [CCDirector sharedDirector].winSize;
  

        // (@"%@",[self parent]);
        
    
        
   /*
        CGPoint x=[ourPlayer1 position];
        x=ourPlayer1.position;
        */
    }
    return self;
}



@end
