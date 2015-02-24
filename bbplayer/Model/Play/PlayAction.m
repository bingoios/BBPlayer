//
//  PlayAction.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "PlayAction.h"
#import <AVFoundation/AVFoundation.h>

@interface PlayAction()

@property (strong, nonatomic) AVAudioPlayer* player;
@property (strong, nonatomic) SongInfo* song;
@property (nonatomic, readwrite) PlayStatus playStatus;


@end

@implementation PlayAction

-(NSTimeInterval)currentTime {
    if (!self.player) {
        return 0;
    }
    
    return [self.player currentTime];
}

-(NSTimeInterval)duration {
    if (!self.player) {
        return 0;
    }
    
    return [self.player duration];
}

-(BOOL)isPlaying {
    return self.player ? self.player.playing : NO;
}

-(BOOL)playSong:(SongInfo*)song {
    if (!song) {
        self.song = nil;
        self.player = nil;
        return NO;
    } else if (/*self.song != song*/ YES) {
        // 不是同一首歌，需要重新创建AVAudioPlayer
        self.song = song;
        NSURL* url = [NSURL URLWithString:self.song.filePath];
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.player.delegate = self.delegate;
        return [self play];
    } else {
        // 如果是同一首歌，从头开始播放
        return [self.player playAtTime:0.0];
    }
}

-(BOOL) play {
    BOOL ret = [self.player play];
    if (ret) {
        self.playStatus = PlayStatusPlaying;
    }
    return ret;
}

-(BOOL)pause {
    [self.player pause];
    self.playStatus = PlayStatusPause;
    return YES;
}


@end
