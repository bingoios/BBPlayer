//
//  PlayViewController.h
//  bbplayer
//
//  Created by lib－mac on 15-2-24.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayObserver.h"

@interface PlayViewController : UIViewController<PlayManagerObserver>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *playedTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *unplayedTimeLabel;
@property (weak, nonatomic) IBOutlet UISlider *playProgressSlider;

@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@property (strong, nonatomic) NSTimer* playTimer;
@end
