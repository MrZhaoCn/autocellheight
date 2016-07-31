//
//  ViewController.m
//
//  Created by MrZhao on 16/5/17.
//  Copyright © 2016年 MrZhao. All rights reserved.
//

#import "ViewController.h"
#import "ZCTableViewCell.h"
#import "ZCModel.h"
#import "UITableViewCell+ZCAutoCellHeight.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dateSource;
@end

@implementation ViewController

- (NSMutableArray *)dateSource {
    if (_dateSource == nil) {
        
        _dateSource = [NSMutableArray array];
        int titleTotalLength = (int)[[self mainAll] length];
        int descTotalLength = (int)[[self descAll] length];
        for (NSUInteger i = 0; i < 40; ++i) {
            int titleLength = rand() % titleTotalLength + 15;
            if (titleLength > titleTotalLength - 1) {
                titleLength = titleTotalLength;
            }
            
            ZCModel *model = [[ZCModel alloc] init];
            model.mainStr = [[self mainAll] substringToIndex:titleLength];
            
            int descLength = rand() % descTotalLength + 20;
            if (descLength >= descTotalLength) {
                descLength = descTotalLength;
            }
            model.descStr = [[self descAll] substringToIndex:descLength];
            
            [_dateSource addObject:model];
        }

    }
    return _dateSource;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    
}

- (NSString *)mainAll {
    
    return @"欢迎使用自动计算Cell行高扩展，由作者Mrzhao提供，欢迎大家交流email:861127175@qq.com，谢谢！！！";
}

- (NSString *)descAll {
    
    return @"学习开源框架是提升自己的很好方式，不要闭门造车，重复发明轮子！！！！学习开源框架开源框架是提升自己的很好方式，不要闭门造车，重复发明轮子！！！！学习开源框架开源框架是提升自己的很好方式，不要闭门造车，重复发明轮子！！！！钻研别人的开源框架是提升自己的很好方式，不要闭门造车，重复发明轮子！！！！,重要的事情说四遍！！！";
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CELL = @"cell";
    
    ZCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        cell = [[ZCTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
    }
    
    if (indexPath.row < self.dateSource.count) {
        
        ZCModel *model = self.dateSource[indexPath.row];
        [cell configCellWithModel:model];
    }
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZCModel *model = nil;
    if (indexPath.row < self.dateSource.count) {
        
       model = self.dateSource[indexPath.row];
        
    }
    
   return  [ZCTableViewCell cellHeightForTableView:tableView config:^(UITableViewCell *sourceCell) {//必须要进行配置
       ZCTableViewCell *tableViewCell = (ZCTableViewCell *)sourceCell;
       [tableViewCell configCellWithModel:model];
    }];
}

@end
