//
//  BaseMethod.h
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseMethod : NSObject

//加载网络图片
+(void)loadImageWithImg:(UIImageView*) imageView url:(NSString*)urlStr;

//加载网络图片 自定义占位图
+(void) loadImageWithImg:(UIImageView *)imageView url:(NSString *)urlStr placeImg:(NSString*) placeImg;

//显示加载效果圈
+(void) showHUDAddedTo:(UIView*)view animated:(BOOL)animated;
//隐藏加载效果圈
+(void)hideHUDAddedTo:(UIView*) view animated:(BOOL)animated;

//错误提示
+(void)showErrorWithStr:(NSString*)error toView:(UIView*)view;
//正确的提示
+(void)showSuccessWithStr:(NSString*)success toView:(UIView*)view;


//判断有没有网络
+(BOOL)connectionInternet;

@end
