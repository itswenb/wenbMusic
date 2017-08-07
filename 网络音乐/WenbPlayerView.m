/**
 *   WenbPlayerView.m
 *   网络音乐
 *
 *----------Dragon be here!----------/
 *     ┌─┐       ┌─┐
 *  ┌──┘ ┴───────┘ ┴──┐
 *  │                 │
 *  │       ───       │
 *  │  ─┬┘       └┬─  │
 *  │                 │
 *  │       ─┴─       │
 *  │                 │
 *  └───┐         ┌───┘
 *      │         │ 神兽保佑
 *      │         │ 代码无BUG!
 *      │         │
 *      │         └──────────────┐
 *      │                        │
 *      │                        ├─┐
 *      │                        ┌─┘
 *      │                        │
 *      └─┐  ┐  ┌───────┬──┐  ┌──┘
 *        │ ─┤ ─┤       │ ─┤ ─┤
 *        └──┴──┘       └──┴──┘
 * ━━━━━━━━━━━━神兽出没━━━━━━━━━━━━
 *
 * Created by MOMO的小棉袄 on 2017/8/7.
 *   Copyright © 2017年 MOMO的小棉袄. All rights reserved.
 */

#import "WenbPlayerView.h"
#import "AppDelegate.h"

@interface WenbPlayerView()
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end

@implementation WenbPlayerView

- (void)awakeFromNib{
    [super awakeFromNib];
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        self.progress.progress = CMTimeGetSeconds(APP.player.currentItem.currentTime)/CMTimeGetSeconds(APP.player.currentItem.duration);
        NSDateFormatter * format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"hh:mm";
        
        self.time.text = [NSString stringWithFormat:@"%d/%d",(int)CMTimeGetSeconds(APP.player.currentItem.currentTime),(int)CMTimeGetSeconds(APP.player.currentItem.duration)];
        NSLog(@"sdsdsdsdsadfadsgvxvca");
    });
    dispatch_resume(timer);
}

- (IBAction)previous:(id)sender {
    self.progress.progress = 0;
    
}
- (IBAction)pauseORStart:(id)sender {
}
- (IBAction)next:(id)sender {
    self.progress.progress = 0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
