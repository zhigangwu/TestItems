//
//  Asynchronous_ViewController.m
//  TEST
//
//  Created by apple on 2019/3/22.
//  Copyright © 2019年 吴志刚. All rights reserved.
//

#import "Asynchronous_ViewController.h"

@interface Asynchronous_ViewController () <UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    
    NSArray *dataArray_1;
    NSArray *dataArray_2;
}

@end

@implementation Asynchronous_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    
    [self dataRequest];
}

- (void)dataRequest {
    [PPNetworkHelper GET:@"https://opscard.api.autohome.com.cn/app-ops-product-api/pageCard/queryPageCardData?pagetag=shouye_pc&a=2&v=1.0.0&pm=1&model=1&cid=-1" parameters:nil success:^(id responseObject) {
        NSLog(@"responseObject = %@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
//    NSString *htmlString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://db.pcgames.com.cn/war3/HUM_2241.html"] encoding:NSUTF8StringEncoding error:nil];
//    NSLog(@"htmlString = %@",htmlString);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return dataArray_1.count;
    } else {
        return dataArray_2.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        NSDictionary *dic = dataArray_1[indexPath.row];
        cell.textLabel.text = dic[@"tbc_name"];
    } else if (indexPath.section == 1) {
        NSDictionary *dic = dataArray_2[indexPath.row];
        cell.textLabel.text = dic[@"ti_title"];
    }
    
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
