/**
 *   WenbMusicViewController.m
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

#import "WenbMusicViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "WenbMusicInfo.h"
#import "WenbCollectionViewCell.h"
#import "WenbMusic.h"
#import "musicListTableViewController.h"
#import "AppDelegate.h"

#define root_url @"http://118.89.115.175:8888"

@interface WenbMusicViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *playerView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *music;
@property (weak, nonatomic) IBOutlet UICollectionView *musicList;
/** 管理http请求 */
@property (nonatomic ,strong) AFHTTPSessionManager * manager;
/** 标志那种表单源
 * 0 网易云音乐 1 虾米 2 QQ音乐
 */
@property (nonatomic ,assign) NSUInteger type;
/** 歌单列表 */
@property (nonatomic ,strong) NSArray * lists;

@end

@implementation WenbMusicViewController


- (AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [_manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil]];
    }
    return _manager;
}

- (IBAction)musicDidChangeSource:(UISegmentedControl *)sender {
    self.type = sender.selectedSegmentIndex;
    [self loadMusicList];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.musicList registerNib:[UINib nibWithNibName:NSStringFromClass([WenbCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    [self.musicList registerClass:[WenbCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.playerView addSubview:APP.playerView];
}

- (NSArray *)lists{
    if (!_lists) {
        [self loadMusicList];
    }
    return _lists;
}

- (void)loadMusicList{
    NSString * url = [NSString stringWithFormat:@"%@/show_playlist?source=%lu",root_url,(unsigned long)self.type];
    NSLog(@"获取歌单:%@",url);
    
    [self.manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray * musicList = [responseObject objectForKey:@"result"];
        NSMutableArray * arr = [NSMutableArray array];
        for (NSDictionary * dict in musicList) {
            WenbMusicInfo * list = [WenbMusicInfo infoWithDict:dict];
            [arr addObject:list];
        }
        self.lists = arr;
        NSLog(@"%@",self.lists);
        [self.musicList reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark CollectionView 代理方法

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    WenbMusicInfo * info = self.lists[indexPath.row];
    NSString * url = [NSString stringWithFormat:@"%@/playlist?list_id=%@",root_url,info.list_id];
    
    [self.manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        NSArray * info = [responseObject objectForKey:@"tracks"];
        //            NSLog(@"%@",info);
        NSMutableArray * arr = [NSMutableArray array];
        for (NSDictionary * dict in info) {
            WenbMusic * tmp = [WenbMusic musiwWithDict:dict];
            [arr addObject:tmp];
        }
        musicListTableViewController * c = [[NSBundle mainBundle] loadNibNamed:@"musicListTableViewController" owner:nil options:nil].firstObject;
        c.musicInfo = arr;
        c.listInfo = [responseObject objectForKey:@"info"];
        [self presentViewController:c animated:YES completion:^{
            
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",[error localizedDescription]);
    }];
}

#pragma mark CollectionView 布局方法
//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(130, 180);
}
//每一个分组的上左下右间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);
}

#pragma mark CollectionView 数据源方法

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 1;
//}
//获得cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.lists.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID = @"cell";
    WenbCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (!cell) {
        cell = (WenbCollectionViewCell *)[[NSBundle mainBundle] loadNibNamed:@"WenbCollectionViewCell" owner:nil options:nil].firstObject;
    }
    WenbMusicInfo * info = (WenbMusicInfo*)self.lists[indexPath.row];
    cell.titleLabel.text = info.title;
    [cell.showImage sd_setImageWithURL:[NSURL URLWithString:info.cover_img_url]];
    cell.playCount.text = [NSString stringWithFormat:@"播放次数:%lu",(unsigned long)info.play_count];
    
    return cell;
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
