//
//  SongList.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "SongInfo.h"

@interface SongList : NSObject

-(instancetype)init;
-(SongInfo*) songFromIndex:(NSInteger)index;

@property (strong, nonatomic, readonly) NSMutableArray* songs;
@property (strong, nonatomic, readonly) SongInfo* currentSong;
@property (nonatomic) NSInteger currentIndex;

@end
