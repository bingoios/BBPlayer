//
//  PlayManager.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SongInfo.h"
#import "SongList.h"
#import "PlayObserver.h"
#import "PlayBase.h"

@class PlayManagerObserver;

@interface PlayManager : NSObject<AVAudioPlayerDelegate>

+(PlayManager*)sharedPlayManager;

-(BOOL)play;
-(BOOL)playWithIndex:(NSUInteger)index;
-(BOOL)playSongList:(SongList*)songList;
-(BOOL)playSongList:(SongList*)songList index:(NSUInteger)index;
-(BOOL)playNext;
-(BOOL)playPrevious;
-(BOOL)playOrPause;
-(BOOL)pause;
-(BOOL)stop;
-(void)addPlayManagerObserver:(PlayManagerObserver*)observer;
-(void)removePlayManagerObserver:(PlayManagerObserver*)observer;

@property (strong, nonatomic, readonly) SongList* currentSongList;
@property (strong, nonatomic, readonly) SongInfo* currentSong;
@property (nonatomic, readonly) NSTimeInterval currentTime;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, readonly) PlayStatus playStatus;

@end
