/**
 *   WenbMusicInfo.m
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

#import "WenbMusicInfo.h"

@implementation WenbMusicInfo

+ (instancetype)infoWithDict:(NSDictionary*)dict{
    WenbMusicInfo * info = [[[self class] alloc] init];
    [info setValuesForKeysWithDictionary:dict];
    return info;
}

@end
