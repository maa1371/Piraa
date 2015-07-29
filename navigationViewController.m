//
//  navigationViewController.m
//  Piraa
//
//  Created by Helia Taghavi on 7/28/15.
//  Copyright (c) 2015 Gereh. All rights reserved.
//

#import "navigationViewController.h"
#import "customSegue.h"
#

@interface navigationViewController ()<UIViewControllerAnimatedTransitioning>

@end

@implementation navigationViewController
-(UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    NSLog(@"gggggg");

    UIViewController *controller = self.topViewController;
    UIStoryboardSegue *unwindSegue;
    
    if ([controller isKindOfClass:[customSegue class]]) {
        unwindSegue = [controller segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:@"unwind"];
    }
    
    if (unwindSegue) {
        return unwindSegue;
    } else {
        return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:@"unwind"];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"gooooooood");
}

@end
