//
//  XZB_Transition.m
//  XzbTest
//
//  Created by xzb on 2017/1/3.
//  Copyright © 2017年 xzb. All rights reserved.
//

#import "XZB_Transition.h"
#import "UIView+MotionBlur.h"
#import "UIImage+Capture.h"

@interface XZB_Transition ()

@property (nonatomic, strong) NSArray *transitionViewArray;


@end

@implementation XZB_Transition

#pragma mark - 生命周期

#pragma mark - api
+ (instancetype)transitionWithViewArray:(NSArray *)array
{
    XZB_Transition *transition = [[XZB_Transition alloc]init];
    transition.transitionViewArray = array;
    return transition;
}
#pragma mark - getter / setter


#pragma mark - model event

#pragma mark - view event

#pragma mark - private

/**
 动画持续时间
 */
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.7f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController *fromVC = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC   = (UIViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    
    //转场需要动画的视图数组
    NSMutableArray *animationViewsArray = [[NSMutableArray alloc] init];
   
    //做动画的视图;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    @autoreleasepool {
        for (NSArray *startToEndViewArray in self.transitionViewArray)
        {
            UIView *fromVcAnimationView = nil;
            UIView *toVcAnimationView = nil;
            UIImageView *animationImageView = nil;
            {
                fromVcAnimationView = [fromVC valueForKey:startToEndViewArray[0]];
                animationImageView = [[UIImageView alloc] initWithImage:[UIImage captureWithView:fromVcAnimationView]];
                animationImageView.frame = fromVcAnimationView.frame;
                [containerView addSubview:animationImageView];
            }
            
            toVcAnimationView  =  [toVC valueForKey:startToEndViewArray[1]];
            fromVcAnimationView.hidden = YES;
            toVcAnimationView.hidden = YES;
            
            //原图,结果图,动画图
            [animationViewsArray addObject:@[fromVcAnimationView,toVcAnimationView,animationImageView]];
        }

    }
    
    //动画效果
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration delay:0.0f usingSpringWithDamping:0.6f initialSpringVelocity:1.0f options:UIViewAnimationOptionCurveLinear animations:^{
        
        toVC.view.alpha = 1.0;
        for (NSArray *animationArray in animationViewsArray) {
            
            UIImageView *animationImageView = animationArray[2];
            UIView *resultsView =  animationArray[1];
            
            animationImageView.frame = [containerView convertRect:resultsView.frame fromView:resultsView.superview];
            
        }
        
        
    } completion:^(BOOL finished) {
        if (!finished)return ;
        
        for (NSArray *animationArray in animationViewsArray) {
            
            UIView *fromVcAnimationView = animationArray[0];
            UIView *toVcAnimationView = animationArray[1];
            UIImageView *animationImageView = animationArray[2];
            
            fromVcAnimationView.hidden = NO;
            toVcAnimationView.hidden = NO;
            
            [animationImageView removeFromSuperview];
        }
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}
#pragma mark - delegete

#pragma mark - notification

#pragma mark - kvo

@end