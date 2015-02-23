//
//  SongCell.h
//  bbplayer
//
//  Created by lib－mac on 15-2-23.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;

@end
