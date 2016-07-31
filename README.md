# autocellheight
本框架主要是为了方便计算cell的高度，避免我们每次要手动计算cell高度带来的不便。
使用本框架只需要设置cell的最后一个View(zc_LastViewInCell;
zc_bottomOffSetToCell; 可选项，/**cell底部距离最后一个View的距离，可以设置，默认为0。*/
使用+(CGFloat)cellHeightForTableView:(UITableView *)tableView config:(cellBlock)config;返回cell的高度，具体使用参见代码示例。
本框架对性能有一点影响。
