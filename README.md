# ZBTransitionTest

![image](https://github.com/k373379320/ZBTransitionTest/blob/master/1.gif)




#转场动画演示

##使用:

```
1.导入
#import "XZB_Transition.h"
2.代理
@interface ZC1ViewController ()<UINavigationControllerDelegate>
3.设置代理对象
  self.navigationController.delegate = self;
4. 
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
```

