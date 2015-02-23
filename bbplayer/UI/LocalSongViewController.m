//
//  LocalSongViewController.m
//  bbplayer
//
//  Created by lib－mac on 15-2-23.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "LocalSongViewController.h"
#import "SongTableViewCell.h"
#import "PlayManager.h"

@implementation LocalSongViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.songList = [[SongList alloc] init];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songList.songs.count;
}


//方法类型：系统方法
//编   写：
//方法功能：行数据呈现
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SongCell";
    SongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    SongInfo* song = [self.songList.songs objectAtIndex:indexPath.row];
    
    cell.indexLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    
    cell.titleLabel.text = song.title;
    cell.artistLabel.text = song.artist;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[PlayManager sharedPlayManager] playSongList:self.songList index:indexPath.row];
}

@end
