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
    
    SongInfo* song = [[SongInfo alloc] init];
    song.filePath = [[NSBundle mainBundle] pathForResource:@"timefly" ofType:@"mp3"];
    song.title = @"时间都去哪儿了";
    song.artist = @"王铮亮";
    song.album = @"";
    song.imagePath = [[NSBundle mainBundle] pathForResource:@"timefly" ofType:@"jpg"];
    [self.songs addObject:song];
    
    SongInfo* song2 = [[SongInfo alloc] init];
    song2.filePath = [[NSBundle mainBundle] pathForResource:@"paomo" ofType:@"mp3"];
    song2.title = @"泡沫";
    song2.artist = @"邓紫棋";
    song2.album = @"";
    song2.imagePath = [[NSBundle mainBundle] pathForResource:@"paomo" ofType:@"jpg"];
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
