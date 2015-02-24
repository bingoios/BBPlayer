//
//  PlayViewController.m
//  bbplayer
//
//  Created by lib－mac on 15-2-24.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "PlayViewController.h"
#import "PlayManager.h"

@implementation PlayViewController

-(void)viewDidLoad {
    self.playTimer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self
                                                    selector:@selector(firePlayTimer)
                                                    userInfo:nil repeats:YES];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[PlayManager sharedPlayManager] addPlayManagerObserver:self];
    [self.playTimer setFireDate:[NSDate distantPast]];
    [self updateSongInfo];
    [self updatePlayButtonStatus];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[PlayManager sharedPlayManager] removePlayManagerObserver:self];
    [self.playTimer setFireDate:[NSDate distantFuture]];
}

- (IBAction)previousButtonClick:(UIButton *)sender {
    [[PlayManager sharedPlayManager] playPrevious];
}

- (IBAction)playButtonClick:(UIButton *)sender {
    [[PlayManager sharedPlayManager] play];
}

- (IBAction)pauseButtonClick:(UIButton *)sender {
    [[PlayManager sharedPlayManager] pause];
}

- (IBAction)playNextButtonClick:(UIButton*)sender {
    [[PlayManager sharedPlayManager] playNext];
}

- (IBAction)palyModeButtonClick:(UIButton *)sender {
}

-(void)songChanged {
    [self updateSongInfo];
}

-(void)songListChanged {
    
}

-(void)playStatusChanged {
    [self updatePlayButtonStatus];
}

-(void)updateSongInfo {
    PlayManager* playManager = [PlayManager sharedPlayManager];
    self.titleLabel.text = playManager.currentSong.title;
    self.artistLabel.text = playManager.currentSong.artist;
}

-(void)updatePlayButtonStatus {
    PlayManager* playManager = [PlayManager sharedPlayManager];
    BOOL isPause = playManager.playStatus == PlayStatusPause;
    self.playButton.hidden = !isPause;
    self.pauseButton.hidden = isPause;
}

-(void)firePlayTimer {
    
    PlayManager* playManager = [PlayManager sharedPlayManager];
    NSTimeInterval currentTime = playManager.currentTime;
    NSTimeInterval duration = playManager.duration;
    NSTimeInterval remainTime = duration - currentTime;

    self.playedTimeLabel.text = [NSString stringWithFormat:@"%li:%02li",
                                 lround(floor(currentTime / 60.)) % 60,
                                 lround(floor(currentTime)) % 60];

    self.unplayedTimeLabel.text = [NSString stringWithFormat:@"-%li:%02li",
                                 lround(floor(remainTime / 60.)) % 60,
                                 lround(floor(remainTime)) % 60];
    
    if (fabs(duration) > 0.5) {
        self.playProgressSlider.maximumValue = (float)duration;
        self.playProgressSlider.minimumValue = 0.0f;
        [self.playProgressSlider setValue:(float)currentTime animated:YES];
    } else {
        self.playProgressSlider.enabled = NO;
    }
}


@end
