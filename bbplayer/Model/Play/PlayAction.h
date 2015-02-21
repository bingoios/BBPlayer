//
//  PlayAction.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SongInfo.h"

@interface PlayAction : NSObject

-(instancetype)initWithSong:(SongInfo*) song;

@property (strong, nonatomic) SongInfo* song;

@end
