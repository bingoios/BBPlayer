//
//  SongList.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "SongList.h"

@interface SongList()
@property (strong, nonatomic, readwrite) NSMutableArray* songs;
@end


@implementation SongList

-(NSMutableArray*)songs {
    if (!_songs) {
        _songs = [[NSMutableArray alloc] init];
    }
    return _songs;
}

@end
