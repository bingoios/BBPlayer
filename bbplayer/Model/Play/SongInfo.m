//
//  SongInfo.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "SongInfo.h"

#define DEFAULT_TITLE   @"BBPlayer"

@implementation SongInfo

-(NSString*)album {
    if (_album && (_album.length > 0)) {
        return _album;
    } else {
        return DEFAULT_TITLE;
    }
}

@end
