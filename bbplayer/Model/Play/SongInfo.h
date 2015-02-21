//
//  SongInfo.h
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongInfo : NSObject

@property (strong, nonatomic) NSString* path;
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* album;
@property (strong, nonatomic) NSString* artist;

@end
