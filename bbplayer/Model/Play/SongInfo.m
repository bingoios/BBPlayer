//
//  SongInfo.m
//  bbplayer
//
//  Created by lib－mac on 15-2-21.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "SongInfo.h"

#define PRODUCT_NAME    @"BBPlayer"
#define DEFAULT_TITLE   PRODUCT_NAME
#define DEFAULT_ALBUM   PRODUCT_NAME
#define DEFAULT_ARTIST  @""


@implementation SongInfo

-(NSString*)path {
    if (_path&& (_path.length > 0)) {
        return _path;
    } else {
        return @"";
    }
}

-(NSString*)title {
    if (_title && (_title.length > 0)) {
        return _title;
    } else {
        return DEFAULT_TITLE;
    }
}

-(NSString*)album {
    if (_album && (_album.length > 0)) {
        return _album;
    } else {
        return DEFAULT_ALBUM;
    }
}

-(NSString*)artist {
    if (_artist && (_artist.length > 0)) {
        return _artist;
    } else {
        return DEFAULT_ARTIST;
    }
}

@end
