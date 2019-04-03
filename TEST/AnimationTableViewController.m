//
//  AnimationTableViewController.m
//  TEST
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "AnimationTableViewController.h"
#import "AnimationViewController.h"
#import "GradientDisappears_ViewController.h"
#import "BannerViewController.h"
#import "CollectionViewController.h"
#import "ZGPageMenu_ViewController.h"
#import "Asynchronous_ViewController.h"

@interface AnimationTableViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *array;

@end

@implementation AnimationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.array = [NSArray array];
    self.array = @[@"动画1",@"动画2",@"动画3",@"CollectionViewController",@"PageMenu",@"异步"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        AnimationViewController *animation = [[AnimationViewController alloc] init];
        [self.navigationController pushViewController:animation animated:true];
    } else if (indexPath.row == 1) {
        GradientDisappears_ViewController *dg = [[GradientDisappears_ViewController alloc] init];
        dg.title = self.array[indexPath.row];
        [self.navigationController pushViewController:dg animated:true];
    } else if (indexPath.row == 2) {
        BannerViewController *banner = [[BannerViewController alloc] init];
        [self.navigationController pushViewController:banner animated:true];
    } else if (indexPath.row == 3) {
        CollectionViewController *makewish = [[CollectionViewController alloc] init];
        [self.navigationController pushViewController:makewish animated:true];
    } else if (indexPath.row == 4) {
        ZGPageMenu_ViewController *pagemenu = [[ZGPageMenu_ViewController alloc] init];
        [self.navigationController pushViewController:pagemenu animated:true];
    } else if (indexPath.row == 5) {
        Asynchronous_ViewController *pagemenu = [[Asynchronous_ViewController alloc] init];
        [self.navigationController pushViewController:pagemenu animated:true];
    }
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
