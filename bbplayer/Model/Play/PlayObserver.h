//
//  PlayObserver.h
//  bbplayer
//
//  Created by lib－mac on 15-2-22.
//  Copyright (c) 2015年 everydaygame. All rights reserved.
//

#ifndef bbplayer_PlayObserver_h
#define bbplayer_PlayObserver_h

@protocol PlayManagerObserver
@required
-(void)songChanged;
-(void)songListChanged;
-(void)playStatusChanged;

@end


#endif
