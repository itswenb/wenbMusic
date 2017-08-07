//
//  musicListTableViewController.m
//  网络音乐
//
//  Created by MOMO的小棉袄 on 2017/8/7.
//  Copyright © 2017年 MOMO的小棉袄. All rights reserved.
//

#import "musicListTableViewController.h"
#import <AFNetworking.h>
#import "WenbMusic.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "AppDelegate.h"

#define root_url @"http://118.89.115.175:8888"

@interface musicListTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *musicsTableView;
/** <#注释#> */
@property (nonatomic ,strong) UILabel * footerView;


@end

@implementation musicListTableViewController

- (UILabel *)footerView{
    if (!_footerView) {
        _footerView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
        _footerView.backgroundColor = [UIColor lightGrayColor];
        _footerView.text = @"暂时没有播放的歌曲";
    }
    return _footerView;
}

- (void)viewDidLoad {
    //    if (self.musicInfo)
    
    
    
    [super viewDidLoad];
    
    UISwipeGestureRecognizer * recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
}
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (NSArray *)musicInfo{
    if (!_musicInfo) {
        _musicInfo = [NSArray array];
    }
    return _musicInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

# pragma mark tableView代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"You selected %@",[tableView cellForRowAtIndexPath:indexPath].textLabel.text);
    
    
    WenbMusic * info = self.musicInfo[indexPath.row];
    
    if(APP.player){
        [APP.player pause];
    }else{
        APP.player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",root_url,info.url]]];
    }
    [APP.player play];
    NSLog(@"歌曲地址:%@",[NSString stringWithFormat:@"%@%@",root_url,info.url]);
    
    self.footerView.text = [NSString stringWithFormat:@"正在播放:%@",info.title];

}

# pragma mark tableView数据源方法

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
////    if (section != 1) {
////        return nil;
////    }
//    return APP.playerView;
//    
//}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"当前没有播放的歌曲";
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  self.musicInfo.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [self.listInfo objectForKey:@"title"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    WenbMusic * info = self.musicInfo[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:info.img_url] placeholderImage:[UIImage imageNamed:@"1"]];
    cell.textLabel.text = info.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"专辑:%@ 来源:%@",info.album,info.source];
    
    return cell;
}


@end
