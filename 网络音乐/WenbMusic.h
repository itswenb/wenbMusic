/**
 *   WenbMusic.h
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

@interface WenbMusic : NSObject

/** album */
@property (nonatomic ,strong) NSString * album;
/** source */
@property (nonatomic ,strong) NSString * source;
/** title */
@property (nonatomic ,strong) NSString * title;
/** url */
@property (nonatomic ,strong) NSString * url;
/** img_url */
@property (nonatomic ,strong) NSString * img_url;
/** artist_id */
@property (nonatomic ,strong) NSString * artist_id;
/** artist */
@property (nonatomic ,strong) NSString * artist;
/** album_id */
@property (nonatomic ,strong) NSString * album_id;
/** id */
@property (nonatomic ,strong) NSString * ID;
/** source_url */
@property (nonatomic ,strong) NSString * source_url;

+ (instancetype)musiwWithDict:(NSDictionary*)dict;

@end
