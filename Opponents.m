//
//  Opponents.m
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "Opponents.h"


@implementation Opponents
@synthesize ML1;
@synthesize MB1;
@synthesize MR1;
@synthesize MF1;
@synthesize MLD1;
@synthesize MRD1;
@synthesize MBLD1;
@synthesize MBRD1;
@synthesize background;
@synthesize joystick;


int global;


-(void)stateChangeByDegrees:(float)degrees
{
    if(degrees>-22.5 && degrees<22.5)
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

    else if(degrees<-22.5&&degrees>-67.5)
    {
        if([self characterState]!=KstateRunningBackwardRightDiagnol)
        {
            [self changeState:KstateRunningBackwardRightDiagnol];
        }
    }
    
    else if(degrees<-67.5||degrees>247.5)
    {
        if([self characterState]!=KstateRunningBackward)
        {
            [self changeState:KstateRunningBackward];
        }
    }
    
}



-(void)changeState:(CharacterStates)newState {
    [self stopAllActions];
    CCAction *action = nil;
    
    [self setCharacterState:newState];
    

        
        switch (newState) {
            case kstateFallingDownBackward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p1.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,-140)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownForward:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p5.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(0,+140)];
                action.tag=34;
            }
                break;
            case kstateFallingDownRight:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p27.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(140,0)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownLeft:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p28.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-140,0)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p5.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,70)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p5.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,70)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownBackwardLeftDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p1.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(-70,-70)];
                action.tag=34;
            }
                break;
                
            case kstateFallingDownBackwardRightDiagnol:
            {
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"p1.png"]];
                //[self setPosition:ccp(self.position.x,self.position.y-100)];
                action=[CCMoveBy actionWithDuration:0.3 position:ccp(70,-70)];
                action.tag=34;
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
            case kstateStandingRight:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OR3.png"]];
                
                break;
            case kstateStandingLeft:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OL3.png"]];
                
                break;
            case kstateStandingRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"ORD3.png"]];
                
                break;
            case kstateStandingLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OLD3.png"]];
                
                break;
            case kstateStandingForward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OF3.png"]];
                
                break;
            case kstateStandingBackward:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OB3.png"]];
                
                break;
            case kstateStandingBackwardLeftDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OBLD3.png"]];
                
                break;
            case kstateStandingBackwardRightDiagnol:
                [self setDisplayFrame:[[CCSpriteFrameCache
                                        sharedSpriteFrameCache]
                                       spriteFrameByName:@"OBRD3.png"]];
                
                break;
                
                
        
        
    }
    
        if((self.characterState==kstateFallingDownBackward)||(self.characterState==kstateFallingDownForward)||(self.characterState==kstateFallingDownRight)||(self.characterState==kstateFallingDownLeft)||(self.characterState==kstateFallingDownRightDiagnol)||(self.characterState==kstateFallingDownLeftDiagnol)||(self.characterState==kstateFallingDownBackwardRightDiagnol)||(self.characterState==kstateFallingDownBackwardLeftDiagnol))
    {
        [self runAction:action];
        
        return;
    }
    
    if (action != nil) {
        CCRepeatForever *repeatForever=[CCRepeatForever actionWithAction:action];
        repeatForever.tag=36;
        [self runAction:repeatForever];
    }
    if(self.characterState==kstateFallingDownBackward)
    {
        CCLOG(@"%x",self.numberOfRunningActions);
        
    CCLOG(@"%@",[self getActionByTag:36]);
    }
}

-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray *)listOfGameObjects
{

    if((self.characterState==kstateFallingDownBackward)||(self.characterState==kstateFallingDownForward)||(self.characterState==kstateFallingDownRight)||(self.characterState==kstateFallingDownLeft)||(self.characterState==kstateFallingDownRightDiagnol)||(self.characterState==kstateFallingDownLeftDiagnol)||(self.characterState==kstateFallingDownBackwardRightDiagnol)||(self.characterState==kstateFallingDownBackwardLeftDiagnol))
    {
        if(check==0)
        {
            /*
            if(self.characterState==kstateFallingDownBackward)
            {
                [self changeState:kstateFallingDownBackward];
            }
            if(self.characterState==kstateFallingDownForward)
            {
                [self changeState:kstateFallingDownForward];
            }
            if(self.characterState==kstateFallingDownRight)
            {
                [self changeState:kstateFallingDownRight];
            }
            if(self.characterState==kstateFallingDownLeft)
            {
                [self changeState:kstateFallingDownLeft];
            }
            if(self.characterState==kstateFallingDownRightDiagnol)
            {
                [self changeState:kstateFallingDownRightDiagnol];
            }
            if(self.characterState==kstateFallingDownLeftDiagnol)
            {
                [self changeState:kstateFallingDownLeftDiagnol];
            }
            if(self.characterState==kstateFallingDownBackwardRightDiagnol)
            {
                [self changeState:kstateFallingDownBackwardRightDiagnol];
            }
            if(self.characterState==kstateFallingDownBackwardLeftDiagnol)
            {
                [self changeState:kstateFallingDownBackwardLeftDiagnol];
            }
            */
            check++;
        }
        CCLOG(@"%@",[self getActionByTag:34]);
        return;
    }
    
    if(gameHasWon&&[self numberOfRunningActions]!=0)
    {
        [self changeState:kstateStandingForward];
        //[self stopAllActions];
        return;
    }
    if(gameHasWon&&[self numberOfRunningActions]==0)
    {
        return;
    }
    
    if(global==0)
    {
        players[0]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
        players[1]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        players[2]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];
        
        background=(GameCharacter*)[[[self parent]parent] getChildByTag:kBackgroundImageTagValue];
        
        
        
        
    }
    if(gameHasStarted==TRUE&&[self characterState]!=kstateFallingDownBackward)
    {
        CGPoint positionToTrack=players[playerHasBall-1].position;
//        self.position=positionToTrack;
        float xTotalDistance,yTotalDistance;
        xTotalDistance=positionToTrack.x- self.position.x;
        yTotalDistance=positionToTrack.y-self.position.y;
        float angle;
        if(xTotalDistance!=0)
        {
        angle= atan(yTotalDistance/xTotalDistance);
            if(xTotalDistance>0&&yTotalDistance<0)
            {
            }
 
            else if (xTotalDistance<0)
            {
                angle=3.14+angle;
            }

        }
        else if(yTotalDistance>3)
        {
            angle=85;
        }
        else if(yTotalDistance<-3)
        {
            angle=265;
        }
        
        CGPoint distanceToCover;
        distanceToCover.x=round(cosf(angle)*3);
        distanceToCover.y=round(sinf(angle)*3);

        if(joystick.velocity.x==0&&joystick.velocity.y==0)
        {
CGPoint newPosition=CGPointMake( self.position.x + distanceToCover.x,self.position.y+distanceToCover.y);
self.position=newPosition;
            [self stateChangeByDegrees:angle*57.3];
        }
        else
        {
            CGPoint scaledVelocity = ccpMult(joystick.velocity, 200.0f);
            float xDistance=scaledVelocity.x*deltaTime;
            float yDistance=scaledVelocity.y*deltaTime;
            
            if(background.characterState==kStateBackgroundMoving)
            {
            CGPoint newPosition=CGPointMake(self.position.x+distanceToCover.x-xDistance, self.position.y+distanceToCover.y-yDistance);
                self.position=newPosition;
                /*
                float angle2=atan(distanceToCover.y-yDistance/distanceToCover.x-xDistance);
                if(distanceToCover.x-xDistance<0)
                {
                    angle2=angle2+3.14;
                }
                 */
                [self stateChangeByDegrees:angle*57.3];
                
                
            }
            
            if(background.characterState==kStateBackgroundNotMovingLeft||background.characterState==kStateBackgroundNotMovingRight)
            {
                CGPoint newPosition=CGPointMake(self.position.x+distanceToCover.x, self.position.y+distanceToCover.y-yDistance);
                self.position=newPosition;
                /*
                float angle2=atan(distanceToCover.y-yDistance/distanceToCover.x);
                if(distanceToCover.x<0)
                {
                    angle2=angle2+3.14;
                }
                 */
                                [self stateChangeByDegrees:angle*57.3];
            }
            
            
            

        }
        


    }
     
}


#pragma mark -
-(void)initAnimations {
    
    //CCLOG(@"initializing animations");
    [self setML1:[self loadPlistForAnimationWithName:@"ML1" andClassName:NSStringFromClass([self class])]];
    [self setMR1:[self loadPlistForAnimationWithName:@"MR1" andClassName:NSStringFromClass([self class])]];
    [self setMLD1:[self loadPlistForAnimationWithName:@"MLD1" andClassName:NSStringFromClass([self class])]];
    [self setMRD1:[self loadPlistForAnimationWithName:@"MRD1" andClassName:NSStringFromClass([self class])]];
    [self setMBLD1:[self loadPlistForAnimationWithName:@"MBLD1" andClassName:NSStringFromClass([self class])]];
    [self setMBRD1:[self loadPlistForAnimationWithName:@"MBRD1" andClassName:NSStringFromClass([self class])]];
       
    [self setMF1:[self loadPlistForAnimationWithName:@"MF1" andClassName:NSStringFromClass([self class])]];
   
    [self setMB1:[self loadPlistForAnimationWithName:@"MB1" andClassName:NSStringFromClass([self class])]];
       
    //CCLOG(@"animations have been initialized");
    
}



-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        //CCLOG(@"Opponent initialized");
        global=0;
        [self initAnimations];
        gameObjectType=kOpponent;
        check=0;
    }
    return self;
}



@end
