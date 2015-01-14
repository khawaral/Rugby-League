//
//  Circle.h
//  RugbyLeague
//
//  Created by khawar ali on 1/28/13.
//
//

#import "GameCharacter.h"

@interface Circle : GameCharacter
{
    int global;
    CCAnimation *animationVar;
}

@property(nonatomic,retain) CCAnimation *animationVar;

@end
