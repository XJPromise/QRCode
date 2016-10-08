//
//  ViewController.m
//  QRCodeDemo
//
//  Created by puxj on 16/9/12.
//  Copyright © 2016年 bcinfo. All rights reserved.
//

#import "ViewController.h"
#import "XJQRCodeViewController.h"
#import "QRCodeCreateViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arrayData;

@end

@implementation ViewController

- (NSMutableArray *)arrayData {
    if (!_arrayData) {
        
        _arrayData = [[NSMutableArray alloc]initWithObjects:@"生成普通二维码",@"生成带logo的二维码",@"识别二维码", nil];
    }
    return _arrayData;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.frame = CGRectMake(0, 0,ScreenWidth , ScreenHeight);
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.arrayData[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        
        case 0: {
            
            QRCodeCreateViewController *codeVC = [[QRCodeCreateViewController alloc] init];
            codeVC.isHaveLogo = NO;
            [self.navigationController pushViewController:codeVC animated:YES];
        
        }
            break;
        case 1: {
            
            QRCodeCreateViewController *codeVC = [[QRCodeCreateViewController alloc] init];
            codeVC.isHaveLogo = YES;
            [self.navigationController pushViewController:codeVC animated:YES];
            
        }
            break;
        case 2: {
            
            XJQRCodeViewController *QRCodeVC = [[XJQRCodeViewController alloc] init];
            [self.navigationController pushViewController:QRCodeVC animated:YES];

        }
            break;
            
        default:
            break;
    }
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"生成识别二维码";
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
