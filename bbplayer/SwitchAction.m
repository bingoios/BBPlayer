//
//  SwitchAction.m
//  bbplayer
//
//  Created by lib－mac on 15-2-22.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "SwitchAction.h"

@implementation SwitchAction

-(BOOL)switchNext {
    if (!self.songList || self.songList.songs.count == 0)
        return NO;
    
    NSInteger index = self.songList.currentIndex;
    index++;
    if (index >= self.songList.songs.count)
        index = 0;
    self.songList.currentIndex = index;
    return YES;
}

-(BOOL)switchPrevious {
    if (!self.songList || self.songList.songs.count == 0)
        return NO;
    
    NSInteger index = self.songList.currentIndex;
    index--;
    if (index < 0)
        index = self.songList.songs.count - 1;
    self.songList.currentIndex = index;
    return YES;
}

-(BOOL)switchToIndex:(NSInteger)index {
    if (!self.songList)
        return NO;
    
    self.songList.currentIndex = index;
    return YES;
}

@end
