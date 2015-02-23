//
//  ViewController.m
//  bbplayer
//
//  Created by lib－mac on 15-2-20.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#import "ViewController.h"
#import "PlayAction.h"
#import "PlayManager.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (weak, nonatomic) PlayManager* playManager;

@end

@implementation ViewController

-(PlayManager*)playManager {
    return [PlayManager sharedPlayManager];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Once the view has loaded then we can register to begin recieving controls and we can become the first responder
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self becomeFirstResponder];
    [self configNowPlayingInfoCenter];
    
    [self initPlayer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self becomeFirstResponder];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    //End recieving events
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(void)remoteControlReceivedWithEvent:(UIEvent *)event{
    
    //if it is a remote control event handle it correctly
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlTogglePlayPause:
            {
                NSLog(@"UIEventSubtypeRemoteControlTogglePlayPause...");
                [self.playManager playOrPause];
                break;
            }
            case UIEventSubtypeRemoteControlPlay:
            {
                NSLog(@"UIEventSubtypeRemoteControlPlay...");
                [self.playManager play];
                break;
            }
            case UIEventSubtypeRemoteControlPause:
            {
                NSLog(@"UIEventSubtypeRemoteControlPause...");
                [self.playManager pause];
                break;
            }
            case UIEventSubtypeRemoteControlStop:
            {
                NSLog(@"UIEventSubtypeRemoteControlStop...");
                [self.playManager stop];
                break;
            }
            case UIEventSubtypeRemoteControlNextTrack:
            {
                NSLog(@"UIEventSubtypeRemoteControlNextTrack...");
                [self.playManager playNext];
                break;
            }
            case UIEventSubtypeRemoteControlPreviousTrack:
            {
                NSLog(@"UIEventSubtypeRemoteControlPreviousTrack...");
                [self.playManager playPrevious];
                break;
            }
                
            default:
                break;
        }
    }
    
}

//设置锁屏状态，显示的歌曲信息
-(void)configNowPlayingInfoCenter{
    
    if (NSClassFromString(@"MPNowPlayingInfoCenter")) {
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        SongInfo* song = self.playManager.currentSong;
        if (song)
        {
            [dict setObject:song.title forKey:MPMediaItemPropertyTitle];
            [dict setObject:song.artist forKey:MPMediaItemPropertyArtist];
            [dict setObject:song.album forKey:MPMediaItemPropertyAlbumTitle];
            
            UIImage *image = [UIImage imageWithContentsOfFile:song.imagePath];
            MPMediaItemArtwork *artwork = [[MPMediaItemArtwork alloc] initWithImage:image];
            [dict setObject:artwork forKey:MPMediaItemPropertyArtwork];

        }
        
        [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
        
    }
    
}

- (void) initPlayer {
    static BOOL isInited = NO;
    if (!isInited) {
        [self.playManager addPlayManagerObserver:self];
        SongList* songList = [[SongList alloc] init];
        [self.playManager playSongList:songList];
        isInited = YES;
    }
}

-(void)songChanged {
    [self configNowPlayingInfoCenter];
}

-(void)songListChanged {
    
}

@end
