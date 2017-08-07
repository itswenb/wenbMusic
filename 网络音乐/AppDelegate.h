//
//  AppDelegate.h
//  网络音乐
//
//  Created by MOMO的小棉袄 on 2017/7/30.
//  Copyright © 2017年 MOMO的小棉袄. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSAudioStream.h>
#import <AVFoundation/AVFoundation.h>
#import "WenbPlayerView.h"

#define APP ((AppDelegate*)[[UIApplication sharedApplication] delegate])

@interface AppDelegate : UIResponder <UIApplicationDelegate>

/** 音乐播放器 */
@property (nonatomic ,strong) AVPlayer * player;

@property (strong, nonatomic) UIWindow *window;

/** 播放器View */
@property (nonatomic ,strong) WenbPlayerView * playerView;

@end

