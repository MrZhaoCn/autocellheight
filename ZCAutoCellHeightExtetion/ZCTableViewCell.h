//
//  ZCTableViewCell.h
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZCModel;
@interface ZCTableViewCell : UITableViewCell
- (void)configCellWithModel:(ZCModel *)model;
@end
