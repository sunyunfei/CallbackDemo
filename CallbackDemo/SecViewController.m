//
//  SecViewController.m
//  CallbackDemo
//
//  Created by 孙云 on 15/12/14.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()<UITextFieldDelegate>
//输入textfield
@property (weak, nonatomic) IBOutlet UITextField *backField;
@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"瞅你咋的";
    //全局增加一个点击事件，让点击屏幕键盘下去
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(keyHidden)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  键盘下去方法
 */
-(void)keyHidden
{
    [self.backField resignFirstResponder];
}
#pragma mark
#pragma maek------输入框代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self callBackThree];
}
/**
 *  第一种方法：通知回传
 */
-(void)callBackOne
{
    NSDictionary *dic = @{@"field":self.backField.text};
    [[NSNotificationCenter defaultCenter]postNotificationName:@"callBack"
                                                       object:nil
                                                     userInfo:dic];
}
/**
 *  第二种方法:代理
 */
-(void)callBackTwo
{
    if ([self.delegate respondsToSelector:@selector(callBack:)]) {
        [self.delegate callBack:self.backField.text];
    }
}
/**
 *  第三种方法:块(Block)
 */
-(void)callBackThree
{
    self.callBackBlock(self.backField.text);
}
@end
