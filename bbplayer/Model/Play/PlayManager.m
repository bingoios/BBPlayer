//
//  PlayManager.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "PlayManager.h"
#include <AVFoundation/AVFoundation.h>
#include "PlayAction.h"
#include "SwitchAction.h"

@interface PlayManager()

@property (strong, nonatomic, readwrite) SongList* currentSongList;
@property (strong, nonatomic, readwrite) SongInfo* currentSong;
@property (strong, nonatomic) PlayAction* playAction;
@property (strong, nonatomic) SwitchAction* switchAction;

@end

@implementation PlayManager

static PlayManager *sharedPlayManager = nil;

+(PlayManager*)sharedPlayManager
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedPlayManager = [[self alloc] init];
    });
    return sharedPlayManager;
}

-(PlayAction*)playAction {
    if (!_playAction) {
        _playAction = [[PlayAction alloc] init];
        _playAction.delegate = self;
    }
    return _playAction;
}

-(SwitchAction *)switchAction {
    if (!_switchAction) {
        _switchAction = [[SwitchAction alloc] init];
    }
    return _switchAction;
}

-(SongInfo*)currentSong {
    return self.currentSongList.currentSong;
}

-(BOOL)play {
    return [self.playAction play];
}

-(BOOL)playSong:(SongInfo*)song {
    return [self.playAction playSong:song];
}

-(BOOL)playCurrentSong {
    return [self.playAction playSong:self.currentSong];
}

-(BOOL)playWithIndex:(NSUInteger)index {
    [self.switchAction switchToIndex:index];
    [self playCurrentSong];
    return YES;
}

-(BOOL)playSongList:(SongList*)songList {
    return [self playSongList:songList index:0];
}
-(BOOL)playSongList:(SongList*)songList index:(NSUInteger)index {
    if (!songList)
        return NO;
    
    self.currentSongList = songList;
    self.switchAction.songList = songList;
    [self.switchAction switchToIndex:index];
    
    return [self playCurrentSong];
}

-(BOOL)playNext {
    [self.switchAction switchNext];
    [self playCurrentSong];
    
    return YES;
}

-(BOOL)playPrevious {
    [self.switchAction switchPrevious];
    [self playCurrentSong];
    return YES;
}

-(BOOL)playOrPause {
    if ([self.playAction isPlaying]) {
        return [self.playAction pause];
    }else {
        return [self.playAction play];
    }
}

-(BOOL)pause {
    return [self.playAction pause];
}

-(BOOL)stop {
    return YES;
}

#pragma AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag
{
    [self playNext];
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player
                                 error:(NSError *)error {
    [self playNext];
    
}

@end
