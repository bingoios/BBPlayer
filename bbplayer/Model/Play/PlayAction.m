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

@end

@implementation PlayAction

-(instancetype)initWithSong:(SongInfo*) song {
    if (!song) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.song = song;
    }
    return self;
}

-(AVAudioPlayer*)player {
    if (!_player) {
        NSURL* url = [NSURL URLWithString:self.song.path];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    return _player;
}

@end
