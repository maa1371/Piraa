//
//  BarberShopViewController.m
//  Piraa
//
//  Created by Helia Taghavi on 7/28/15.
//  Copyright (c) 2015 Gereh. All rights reserved.
//

#import "BarberShopViewController.h"
#import "customSegue.h"
#import "unwindSegue.h"
@interface BarberShopViewController ()

@end

@implementation BarberShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnBackView.layer.cornerRadius=self.btnBackView.frame.size.width/2;
    self.BSImageBtn.layer.cornerRadius=self.BSImageBtn.frame.size.width/2;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier {
    unwindSegue *segue = [[unwindSegue alloc] initWithIdentifier:@"unwind" source:fromViewController destination:toViewController];
    NSLog(@"qqqqqq");

    return segue;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"gooooooood");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
