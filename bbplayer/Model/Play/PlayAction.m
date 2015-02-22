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

@end

@implementation PlayAction

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
        NSURL* url = [NSURL URLWithString:self.song.path];
        self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        self.player.delegate = self.delegate;
        return [self.player play];
    } else {
        // 如果是同一首歌，从头开始播放
        return [self.player playAtTime:0.0];
    }
}

-(BOOL) play {
    return [self.player play];
}

-(BOOL)pause {
    [self.player pause];
    return YES;
}


@end
