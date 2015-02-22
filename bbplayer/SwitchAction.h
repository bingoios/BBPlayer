//
//  SwitchAction.h
//  bbplayer
//
//  Created by lib－mac on 15-2-22.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongList.h"

@interface SwitchAction : NSObject

-(BOOL)switchNext;
-(BOOL)switchPrevious;
-(BOOL)switchToIndex:(NSInteger)index;

@property (nonatomic, weak) SongList* songList;

@end
