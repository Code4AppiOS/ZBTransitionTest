//
//  ZC1ViewController.m
//  XzbTest
//
//  Created by xzb on 2017/1/3.
//  Copyright © 2017年 xzb. All rights reserved.
//

#import "ZC1ViewController.h"
#import "ZC2ViewController.h"
#import "XZB_Transition.h"


@interface ZC1ViewController ()<UINavigationControllerDelegate>

@end

@implementation ZC1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"one";
    
    self.view.backgroundColor = [UIColor cyanColor];
   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     self.navigationController.delegate = self;
    ZC2ViewController *vc2 = [[ZC2ViewController alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}
#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    
    if ([toVC isKindOfClass:[ZC2ViewController class]]) {
        
        XZB_Transition *transition = [XZB_Transition transitionWithViewArray:@[@[@"mainImageView",@"mainImageView"],@[@"titleLabel",@"titleLabel"]]];
        
        return transition;
    }else{
        return nil;
    }
}

@end
