//
//  DrawView.m
//  20160321001-Quartz2D-Basic
//
//  Created by Rainer on 16/3/21.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/**
 *  用来画图的方法：只有在这个方法中才能获取到跟view的layer相关联的图形上下文
 *  控制器中view即将显示时掉用此方法（即：在viewWillAppear后掉用）
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 第一种方法：使用C语言函数画图
//    [self drawLineUseStrokPath];
    
    // 第二种方法：使用封装CGContext后的函数画图
//    [self drawLineUseCGContext];
    
    // 第三种方法：使用贝赛尔路径画图
    [self drawLineUBezierPath];
}

/**
 *  第一种方法：使用C语言函数画图
 *  步骤：1.获取当前上下文；2.描述路径（创建路径->设置起点->画线到目标点）；3.将路径添加到上下文；4.渲染上下文。
 *  以上步骤缺一不可
 */
- (void)drawLineUseStrokPath {
    // 1.获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 2.1.创建一个可变路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 2.2.给路径设置一个起点
    CGPathMoveToPoint(path, nil, 50, 50);
    
    // 2.3.添加一根线到目标点
    CGPathAddLineToPoint(path, nil, 200, 200);
    
    // 3.把路径添加到上下文
    CGContextAddPath(contextRef, path);
    
    // 4.渲染上下文
    CGContextStrokePath(contextRef);
}

/**
 *  第二种方法：使用封装CGContext后的函数画图
 */
- (void)drawLineUseCGContext {
    // 1.获取当前上下文
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 2.描述路径
    // 2.1.设置路径起点
    CGContextMoveToPoint(contextRef, 50, 50);
    
    // 2.2.画线到某一点
    CGContextAddLineToPoint(contextRef, 200, 200);
    
    // 3.渲染上下文
    CGContextStrokePath(contextRef);
}

/**
 *  第三种方法：使用贝赛尔路径画图
 */
- (void)drawLineUBezierPath {
    // 1.创建一个贝赛尔路径对象
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // 2.设置起点
    [bezierPath moveToPoint:CGPointMake(50, 50)];
    
    // 3.添加一根线到某个点
    [bezierPath addLineToPoint:CGPointMake(200, 200)];
    
    // 4.绘制路径
    [bezierPath stroke];
}

@end
