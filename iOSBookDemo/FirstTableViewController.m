//
//  FirstTableViewController.m
//  iOSBookDemo
//
//  Created by lianghailiang on 15/12/17.
//  Copyright © 2015年 jinvovo_ios. All rights reserved.
//

#import "FirstTableViewController.h"
#import "FirstTableViewCell.h"
#import <YYKit/YYKit.h>

@interface FirstTableViewController ()

@property (nonatomic, copy, readonly) NSMutableArray *array;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //iOS 8开始的自适应高度，可以不需要实现定义高度的方法
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 170;
    self.title = @"Home";
    
    _array = [[NSMutableArray alloc] initWithObjects:@"GCD全称为Grand Central Dispatch，是libdispatch的市场名称，而libdispatch是Apple的一个库，其为并发代码在iOS和OS X的多核硬件上执行提供支持。确切地说GCD是一套低层级的C API，通过 GCD，开发者只需要向",@"发现了原因。因为我在对cell中的图片进行赋值的时候，是采用的异步加载图片，所以计算图片的高度会需要一会时间，以至于我往后拉一下所有的图片就会恢复",@"3.详见代码部分(ViewController+Tabl",@"", nil];
    
    NSMutableArray *kkk = _array.mutableCopy;
    [kkk removeFirstObject];
    
    NSLog(@"array = %@",_array);
    NSLog(@"kkk = %@",kkk);
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    [tableView clearSelectedRowsAnimated:YES];
    
    [_array setObject:@"UITableViewCell的动态高度计算一直是一个交流讨论的话题，也已经有了很多实现的机制，但更多的是需要一些扩展类什么的，还有需要计算什么的，使用起来比较麻烦。因此这里推荐一种自动计算高度的方法，他是在我的MyXXXXLayout体系内实现的一套机制。" atIndexedSubscript:indexPath.row];
//    [tableView reloadRowAtIndexPath:[NSIndexPath indexPathWithIndex:indexPath.row] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView reloadRow:indexPath.row inSection:0 withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView scrollToRow:indexPath.row inSection:indexPath.section atScrollPosition:0 animated:YES];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstCellId" forIndexPath:indexPath];
    
    
    cell.title_lab.text = [_array objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
