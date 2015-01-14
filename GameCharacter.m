//
//  GameCharacter.m
//  RugbyLeague
//
//  Created by khawar ali on 1/8/13.
//
//

#import "GameCharacter.h"

@implementation GameCharacter

@synthesize desiredLocation;
@synthesize hasBall;

-(void)checkAndClampSpritePosition
{
    CGPoint currentSpritePosition=[self position];
    
    
       
        //clamp for the iPad
        if(currentSpritePosition.x<screenSize.width*0.08)
        {
            [self setPosition:ccp(screenSize.width*0.08, currentSpritePosition.y)];
        }
        else if(currentSpritePosition.x>screenSize.width*0.92)
        {
            [self setPosition:ccp(screenSize.width*0.92, currentSpritePosition.y)];
        }
        
        if(currentSpritePosition.y<screenSize.height*0.03)
        {
            [self setPosition:ccp(currentSpritePosition.x,screenSize.height*0.03 )];
        }
        else if(currentSpritePosition.y>screenSize.width*0.97)
        {
            [self setPosition:ccp(currentSpritePosition.x,screenSize.height*0.97)];
        }
    
    
}

@end
