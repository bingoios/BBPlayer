//
//  PlayManager.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongInfo.h"
#import "SongList.h"

@interface PlayManager : NSObject

@property (strong, nonatomic) SongList* playingSongList;
@property (strong, nonatomic) SongInfo* playingSongInfo;

@end
