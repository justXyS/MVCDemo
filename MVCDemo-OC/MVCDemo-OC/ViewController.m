//
//  ViewController.m
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "MyCell.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<TTModel> *dataList;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        self.tableView.separatorInset = UIEdgeInsetsZero;
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *temp = @[].mutableCopy;
        CellModel *model = nil;
        for (int i = 0; i < 10; i++) {
            model = [CellModel new];
            model.hit = [NSString stringWithFormat:@"%i",i];
            [temp addObject:model];
        }
        weakSelf.dataList = [temp copy];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter and getter
- (void)setDataList:(NSArray<TTModel> *)dataList{
    _dataList = dataList;
    [self.tableView reloadData];
}

@end

@implementation ViewController (TableViewDelegate)

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    [[self.dataList objectAtIndex:indexPath.row] give:cell];
    return cell;
}

@end

