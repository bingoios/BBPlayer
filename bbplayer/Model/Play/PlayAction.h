//
//  PlayAction.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "SongInfo.h"
#import "PlayBase.h"

@interface PlayAction : NSObject

-(BOOL)playSong:(SongInfo*)song;
-(BOOL)play;
-(BOOL)pause;

@property(assign) id<AVAudioPlayerDelegate> delegate;

@property(readonly, getter=isPlaying) BOOL playing;
@property (nonatomic, readonly) NSTimeInterval currentTime;
@property (nonatomic, readonly) NSTimeInterval duration;
@property (nonatomic, readonly) PlayStatus playStatus;


@end
