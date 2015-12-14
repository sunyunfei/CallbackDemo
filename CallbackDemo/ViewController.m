//
//  ViewController.m
//  CallbackDemo
//
//  Created by 孙云 on 15/12/14.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"
@interface ViewController ()<SecViewControllerDelegate>
//点击按钮
- (IBAction)gotoNext;
//显示label
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你瞅啥";
    //接收通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(notCallBack:)
                                                name:@"callBack"
                                              object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  进入下一个控制器按钮事件
 */
- (IBAction)gotoNext {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SecViewController *secVC =[story instantiateViewControllerWithIdentifier:@"Sec"];
    //代理方法的实现
    //secVC.delegate = self;
    //块方法
    __weak typeof(self)weakSelf = self;
    secVC.callBackBlock = ^(NSString *field)
    {
        weakSelf.dataLabel.text = field;
    };
    [self.navigationController pushViewController:secVC animated:YES];
}
/**
 *  通知方法
 *
 *  @param user <#user description#>
 */
-(void)notCallBack:(NSNotification *)user
{
    NSString *field = user.userInfo[@"field"];
    self.dataLabel.text = field;
}
/**
 *   代理方法
 *
 *  @param field <#field description#>
 */
-(void)callBack:(NSString *)field
{
    self.dataLabel.text = field;
}
/**
 *  通知一定要释放
 */
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
