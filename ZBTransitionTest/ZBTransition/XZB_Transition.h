//
//  XZB_Transition.h
//  XzbTest
//
//  Created by xzb on 2017/1/3.
//  Copyright © 2017年 xzb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XZB_Transition : NSObject<UIViewControllerAnimatedTransitioning>


/**
  格式别错了,不想写多余费代码,2维数组,@[@[原图控件name,结果图控件name]];用kvc加载的;
 
 @param array @[@{@"originalView":self.mainImageView,@"resultsView":@"mainImageView"}]

 */
+ (instancetype)transitionWithViewArray:(NSArray *)array;

@end
