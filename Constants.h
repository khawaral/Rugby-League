//
//  Constants.h
//  RugbyLeague
//
//  Created by khawar ali on 1/6/13.
//
//

#ifndef RugbyLeague_Constants_h
#define RugbyLeague_Constants_h




#define kOurPlayerZValue 100
#define kOurPlayer1TagValue 1
#define kOurPlayer2TagValue 2
#define kOurPlayer3TagValue 3
#define kBackgroundImageTagValue 4
#define kBallTagValue 7

#define kGamePlayLayerTag 5
#define kBatchNodeTagValue 6

#define kMainMenuTagValue 10

int numberStageFromPlist;
int numberStage;
int levelNumber;
int numberOfTurnsLeft;

typedef enum
{
    kNoSceneUninitialized=0,
    kMainMenuScene=1,
    kHowToPlayScene=2,
    kStageSelectScene=3,
    kGameScene=105,
    kSettingsScene=5,
    kHighScoresScene=6,
    kCreditsScene=7,
    kBetweenLevelsScene=8,
    kLastScene=9

}SceneTypes;




#endif
