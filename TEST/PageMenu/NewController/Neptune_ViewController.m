//
//  Neptune_ViewController.m
//  TEST
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "Neptune_ViewController.h"
#import "Masonry.h"

@interface Neptune_ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSArray *dataArray;
}

@end

@implementation Neptune_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    
    dataArray = @[@"QQ",@"WECHAT",@"FACEBOOK",@"GITHUB",@"Twitter",@"OCCHINA",@"google",@"baidu",@"orc"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = dataArray[indexPath.row];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
