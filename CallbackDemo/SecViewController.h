//
//  SecViewController.h
//  CallbackDemo
//
//  Created by 孙云 on 15/12/14.
//  Copyright © 2015年 haidai. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SecViewControllerDelegate <NSObject>

//回传
-(void)callBack:(NSString *)field;

@end
@interface SecViewController : UIViewController
//代理
@property(nonatomic,weak)id<SecViewControllerDelegate>delegate;
//块
@property(nonatomic,copy)void(^callBackBlock)(NSString *field);
@end
