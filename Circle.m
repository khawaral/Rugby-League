//
//  Circle.m
//  RugbyLeague
//
//  Created by khawar ali on 1/28/13.
//
//

#import "Circle.h"

@implementation Circle
@synthesize animationVar;



-(void)updateStateWithDeltaTime:(ccTime)deltaTime andListOfGameObjects:(CCArray *)listOfGameObjects
{

    if(global==0)
    {
        animationVar=[CCAnimation animation];
        //[animationVar addFrameWithFilename:@"C1.png"];
        [animationVar addSpriteFrameWithFilename:@"C1.png"];
        [animationVar addSpriteFrameWithFilename:@"C2.png"];
        [animationVar addSpriteFrameWithFilename:@"C3.png"];
        [animationVar addSpriteFrameWithFilename:@"C4.png"];
        [animationVar addSpriteFrameWithFilename:@"C5.png"];
        [animationVar addSpriteFrameWithFilename:@"C6.png"];
        [animationVar addSpriteFrameWithFilename:@"C7.png"];
        [animationVar addSpriteFrameWithFilename:@"C8.png"];
        [animationVar setDelayPerUnit:0.375f];
        id action=nil;
        action=[CCAnimate actionWithAnimation:animationVar];
        
        [self runAction:action];
        global++;
    }
    else
    {
        if([self numberOfRunningActions]==0)
        {
        [self setDisplayFrame:[[CCSpriteFrameCache
                                sharedSpriteFrameCache]
                               spriteFrameByName:@"empty.png"]];
        }
    }
    
}

-(void)initAnimations
{
    animationVar=[CCAnimation animation];
    //[animationVar addFrameWithFilename:@"C1.png"];
    [animationVar addSpriteFrameWithFilename:@"C2.png"];
    [animationVar addSpriteFrameWithFilename:@"C3.png"];
    [animationVar addSpriteFrameWithFilename:@"C4.png"];
    [animationVar addSpriteFrameWithFilename:@"C5.png"];
    [animationVar addSpriteFrameWithFilename:@"C6.png"];
    [animationVar addSpriteFrameWithFilename:@"C7.png"];
    [animationVar addSpriteFrameWithFilename:@"C8.png"];
    [animationVar setDelayPerUnit:0.1f];
    
    
    
}

-(id) initWithTexture:(CCTexture2D *)texture rect:(CGRect)rect rotated:(BOOL)rotated {
    if( (self=[super initWithTexture:texture rect:rect rotated:rotated]) ) {
        CCLOG(@"Circle initialized");
        //global=0;
        global=0;
        animationVar=nil;
       // [self initAnimations];
        
        
    }
    return self;
}

@end
