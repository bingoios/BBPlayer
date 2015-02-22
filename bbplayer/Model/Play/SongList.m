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
@property (strong, nonatomic, readwrite) SongInfo* currentSong;
@end

@implementation SongList

-(void)setCurrentIndex:(NSInteger)currentIndex {
    if (currentIndex < -1 || currentIndex >= self.songs.count) {
        _currentIndex = -1;
    } else {
        _currentIndex = currentIndex;
    }
    
    _currentSong = [self songFromIndex:_currentIndex];
}

-(SongInfo*)currentSong {
    if (!_currentSong && (_currentIndex >= 0)) {
        _currentSong = [self songFromIndex:_currentIndex];
    }
    return _currentSong;
}

// TODO 测试数据，稍后删除
-(void)initTestData {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"timefly" ofType:@"mp3"];
    SongInfo* song = [[SongInfo alloc] init];
    song.path = path;
    [self.songs addObject:song];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"paomo" ofType:@"mp3"];
    SongInfo* song2 = [[SongInfo alloc] init];
    song2.path = path2;
    [self.songs addObject:song2];
}

-(instancetype)init {
    self = [super init];
    if (self) {
        [self initTestData];
        self.currentIndex = -1;
    }
    return self;
}

-(SongInfo*) songFromIndex:(NSInteger)index {
    if (index < 0 || index >= self.songs.count) {
        return nil;
    }
    
    return self.songs[index];
}

-(NSMutableArray*)songs {
    if (!_songs) {
        _songs = [[NSMutableArray alloc] init];
    }
    return _songs;
}



@end
