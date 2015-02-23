//
//  LocalSongViewController.h
//  bbplayer
//
//  Created by lib－mac on 15-2-23.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongList.h"

@interface LocalSongViewController : UITableViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) SongList* songList;

@end
