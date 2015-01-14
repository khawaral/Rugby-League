//
//  Pointer.h
//  RugbyLeague
//
//  Created by khawar ali on 1/18/13.
//
//

#import "GameObject.h"
#import "Players.h"
@interface Pointer : GameObject
{
    GameCharacter* players[3];
    int global;
}
@end
