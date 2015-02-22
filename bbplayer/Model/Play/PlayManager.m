//
//  PlayManager.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "PlayManager.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayAction.h"
#import "SwitchAction.h"

@interface PlayManager()

@property (strong, nonatomic, readwrite) SongList* currentSongList;
@property (strong, nonatomic, readwrite) SongInfo* currentSong;
@property (strong, nonatomic) PlayAction* playAction;
@property (strong, nonatomic) SwitchAction* switchAction;
@property (strong, nonatomic) NSMutableArray* playObservers;

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

-(NSMutableArray*)playObservers {
    if (!_playObservers) {
        _playObservers = [[NSMutableArray alloc] init];
    }
    return _playObservers;
}

-(BOOL)play {
    return [self.playAction play];
}

-(BOOL)playSong:(SongInfo*)song {
    BOOL ret = [self.playAction playSong:song];
    if (ret) {
        [self notifySongChanged];
    }
    return ret;
}

-(BOOL)playCurrentSong {
    return [self playSong:self.currentSong];
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

-(void)addPlayManagerObserver:(PlayManagerObserver*)observer {
    [self.playObservers addObject:observer];
}

-(void)removePlayManagerObserver:(PlayManagerObserver*)observer {
    [self.playObservers removeObject:observer];
}

-(void)notifySongChanged {
    for (id obs in self.playObservers) {
        [obs songChanged];
    }
}

-(void)notifySongListChanged {
    for (id obs in self.playObservers) {
        [obs songListChanged];
    }
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
