//
//  BaseMethod.m
//  MVCFrame
//
//  Created by Leo on 15/10/19.
//  Copyright © 2015年 zhongliang. All rights reserved.
//

#import "BaseMethod.h"
#import "MBProgressHUD+MJ.h"

@implementation BaseMethod

//加载图片 默认自定义图片
+(void) loadImageWithImg:(UIImageView *)imageView url:(NSString *)urlStr
{
   [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"302"]];
}

//加载图片 自定义默认图片
+(void) loadImageWithImg:(UIImageView *)imageView url:(NSString *)urlStr placeImg:(NSString *)placeImg
{
    [imageView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:placeImg]];
}

//显示加载效果
+(void) showHUDAddedTo:(UIView *)view animated:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:view animated:animated];
}

//隐藏加载效果
+(void) hideHUDAddedTo:(UIView *)view animated:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:view animated:animated];
}

//错误信息提示
+(void) showErrorWithStr:(NSString *)error toView:(UIView *)view
{
    [MBProgressHUD showError:error toView:view];
}

//成功信息提示
+(void) showSuccessWithStr:(NSString *)success toView:(UIView *)view
{
    [MBProgressHUD showSuccess:success toView:view];
}

//判断是否有网络
+(BOOL) connectionInternet
{
    //发送网络请求
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    NetworkStatus status = [reach currentReachabilityStatus];
    if(status == NotReachable){
        return NO;  //没有网络
    }
    return true;
}

@end
