//
//  Pointer.m
//  RugbyLeague
//
//  Created by khawar ali on 1/18/13.
//
//

#import "Pointer.h"

@implementation Pointer



-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray *)listOfGameObjects
{
    
    if(global==0)
    {
        screenSize = [CCDirector sharedDirector].winSize;
        players[0]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer1TagValue];
        players[1]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer2TagValue];
        players[2]=(GameCharacter*)[[self parent]getChildByTag:kOurPlayer3TagValue];

        global=1;
    }
    
    for (int i=0; i<3; i++) {
        if(players[i].hasBall==true)
        {
            CGPoint x=players[i].position;
            x.y=x.y+screenSize.height/11;
            
            self.position=x;
            break;
        }
    }
}

-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        CCLOG(@"Pointer initialized");
        //global=0;
        global=0;
        
        
        
    }
    return self;
}
    

@end
