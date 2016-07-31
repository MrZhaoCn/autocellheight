//
//  ZCTableViewCell.m
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//   可以采用你喜欢的方式计算里面子控件的frame

#import "ZCTableViewCell.h"
#import "ZCModel.h"
#import "UITableViewCell+ZCAutoCellHeight.h"

@interface ZCTableViewCell ()
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UILabel *descLabel;
@end
@implementation ZCTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.font = [UIFont systemFontOfSize:15];
        self.mainLabel.numberOfLines = 0;
        [self.contentView addSubview:self.mainLabel];
        
        //可以采用masonry约束子控件
//        [self.mainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(10);
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.height.mas_lessThanOrEqualTo(80);
//        }];
        
        self.descLabel = [[UILabel alloc] init];
        self.descLabel.font = [UIFont systemFontOfSize:15];
        self.descLabel.numberOfLines = 0;
        [self.descLabel sizeToFit];
        [self.contentView addSubview:self.descLabel];
        
//        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(0);
//            make.right.mas_equalTo(0);
//            make.top.mas_equalTo(self.mainLabel.mas_bottom).offset(15);
//        }];
        
        //必须设置，不然计算不了行高
        self.zc_LastViewInCell = self.descLabel;
        //可选项
        self.zc_bottomOffSetToCell = 10;
        
    }
    return self;
}
- (void)configCellWithModel:(ZCModel *)model {
    
    //设置mianframe。手动计算子控件的frame
    CGSize maxSize = CGSizeMake(320, MAXFLOAT);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    CGSize size = [model.mainStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    
    self.mainLabel.frame = CGRectMake(0, 0, size.width,size.height);
    
    CGFloat y = CGRectGetMaxY(self.mainLabel.frame);
    CGSize descSize = [model.descStr boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    self.descLabel.frame = CGRectMake(0, y, descSize.width, descSize.height);
    self.mainLabel.text = model.mainStr;
    self.descLabel.text = model.descStr;
    
}
@end
