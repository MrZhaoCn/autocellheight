//
//  UITableViewCell+ZCAutoCellHeight.h
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//
#import <UIKit/UIKit.h>

/*
 *配置cell的block，每个cell必须配置，不然无法算出高度
 */
typedef void(^cellBlock)(UITableViewCell *sourceCell);

@interface UITableViewCell (ZCAutoCellHeight)
/*
 *cell最后一个控件，必须设置，不然无法计算出行高
 */
@property (nonatomic,strong)UIView *zc_LastViewInCell;
/*
 *cell底部距离最后一个View的距离，可以设置，默认为0。
 */
@property (nonatomic,assign)CGFloat zc_bottomOffSetToCell;
/*
 *返回cell的行高
 */
+(CGFloat)cellHeightForTableView:(UITableView *)tableView config:(cellBlock)config;
@end
