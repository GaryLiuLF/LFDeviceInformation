//
//  LFViewController.m
//  LFDeviceInformation
//
//  Created by gary.liu on 2017/8/15.
//  Copyright © 2017年 LiuLinFei. All rights reserved.
//

#import "LFViewController.h"
#import "LFTableViewCell.h"
#import "LFDeviceInformation.h"

static NSString *const cellID = @"LFTableViewCellID";

@interface LFViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *infoArray;
@property (nonatomic, copy) NSArray *nameArray;

@end

@implementation LFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设备信息";
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.nameString = self.nameArray[indexPath.row];
    cell.infoString = self.infoArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - LazyLoading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 60;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"LFTableViewCell" bundle:nil] forCellReuseIdentifier:cellID];
    }
    return _tableView;
}

- (NSArray *)infoArray {
    if (!_infoArray) {
        _infoArray = [NSArray arrayWithObjects:
                      @([LFDeviceInformation getDeviceScreenWidth]),
                      @([LFDeviceInformation getDeviceScreenHeight]),
                      [LFDeviceInformation getDeviceName],
                      [LFDeviceInformation getiPhoneName],
                      [LFDeviceInformation getAPPVerion],
                      @([LFDeviceInformation getBatteryLevel]),
                      [LFDeviceInformation getSystemName],
                      [LFDeviceInformation getSystemVersion],
                      [LFDeviceInformation getUUID],
                      [LFDeviceInformation getDeviceIPAdress],
                      @([LFDeviceInformation getTotalMemorySize]),
                      @([LFDeviceInformation getAvailableMemorySize]),
                      @([LFDeviceInformation getCurrentBatteryLevel]),
                      [LFDeviceInformation getBatteryState],
                      [LFDeviceInformation getDeviceLanguage], nil];
    }
    return _infoArray;
}

- (NSArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [NSArray arrayWithObjects:
                      @"屏幕宽度",
                      @"屏幕高度",
                      @"设备版本号",
                      @"iPhone名称",
                      @"app版本号",
                      @"电池电量",
                      @"当前系统名称",
                      @"当前系统版本号",
                      @"识别码UUID",
                      @"当前设备IP",
                      @"总内存大小",
                      @"当前可用内存",
                      @"精准电池电量",
                      @"电池当前的状态",
                      @"当前语言", nil];
    }
    return _nameArray;
}

@end
