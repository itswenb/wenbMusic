//
//  WenbCollectionViewCell.m
//  网络音乐
//
//  Created by MOMO的小棉袄 on 2017/8/7.
//  Copyright © 2017年 MOMO的小棉袄. All rights reserved.
//

#import "WenbCollectionViewCell.h"

@implementation WenbCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle]loadNibNamed:@"WenbCollectionViewCell" owner:self options:nil].lastObject;
        self.frame = frame;
    }
    return self;
}

@end
