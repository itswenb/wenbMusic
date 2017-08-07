//
//  WenbCollectionViewCell.h
//  网络音乐
//
//  Created by MOMO的小棉袄 on 2017/8/7.
//  Copyright © 2017年 MOMO的小棉袄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WenbCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playCount;

@end
