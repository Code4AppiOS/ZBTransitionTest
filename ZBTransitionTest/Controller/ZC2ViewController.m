//
//  ZC2ViewController.m
//  XzbTest
//
//  Created by xzb on 2017/1/3.
//  Copyright © 2017年 xzb. All rights reserved.
//

#import "ZC2ViewController.h"
#import "ZC1ViewController.h"
#import "XZB_Transition.h"

@interface ZC2ViewController ()<UINavigationControllerDelegate>
@end

@implementation ZC2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"two";
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.delegate = self;
    
}
#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[ZC1ViewController class]]) {
        XZB_Transition *inverseTransition = [XZB_Transition transitionWithViewArray:@[@[@"mainImageView",@"mainImageView"],@[@"titleLabel",@"titleLabel"]]];
        return inverseTransition;
    }else{
        return nil;
    }
}

@end
