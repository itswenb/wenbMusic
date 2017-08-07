/**
 *   WenbMusicInfo.h
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

#import <Foundation/Foundation.h>

@interface WenbMusicInfo : NSObject

/** 歌单播放次数 */
@property (nonatomic ,assign) NSUInteger play_count;
/** 封面图片URL */
@property (nonatomic ,strong) NSString * cover_img_url;
/** 歌单编号 */
@property (nonatomic ,strong) NSString * list_id;
/** 歌单标题 */
@property (nonatomic ,strong) NSString * title;

+ (instancetype)infoWithDict:(NSDictionary*)dict;

@end
