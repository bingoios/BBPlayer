//
//  ViewController.h
//  bbplayer
//
//  Created by lib－mac on 15-2-20.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioPlayer* player;

@end

