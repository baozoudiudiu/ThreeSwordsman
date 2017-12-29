//
//  WMRootViewController.m
//  wolfmovie
//
//  Created by WangChen on 2017/12/29.
//  Copyright © 2017年 ChenWang. All rights reserved.
//

#import "WMRootViewController.h"

///<Controllers
#import "WMNavigationController.h"

@interface WMRootViewController ()

@end

@implementation WMRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpTabBar];
    [self setUpViewControllers];
}

- (UIViewController *)setUpChildViewControllers:(NSString *)itemTitle vc_class:(NSString *)classString normalImg:(NSString *)norImg selectedImg:(NSString *)selectedImg{
    WMNavigationController *nav = [[WMNavigationController alloc] initWithRootViewController:[[NSClassFromString(classString) alloc]init]];
    nav.tabBarItem.title = itemTitle;
    nav.tabBarItem.image = [[UIImage imageNamed:norImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return nav;
}

- (void)setUpTabBar {
    self.tabBar.tintColor = kTabBarSelectedColor;
}

- (void)setUpViewControllers {
    NSArray *vcClass = [self classArr];
    NSArray *titleArr = [self titlesArr];
    NSArray *norImgs = [self normalImgsArr];
    NSArray *selectedImgs = [self selectedImgsArr];
    NSUInteger count = 4;
    [self checkArrs:@[vcClass, titleArr, norImgs, selectedImgs] count:count];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:count];
    for(int i = 0; i < count; i ++) {
        UIViewController *childVC = [self setUpChildViewControllers:titleArr[i]
                                                           vc_class:vcClass[i]
                                                          normalImg:norImgs[i]
                                                        selectedImg:selectedImgs[i]];
        if(childVC)
            [viewControllers addObject:childVC];
    }
    self.viewControllers = viewControllers;
}

- (void)checkArrs:(NSArray<NSArray *>*)arrs count:(NSUInteger)count{
    [arrs enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj.count < count) {
            *stop = YES;
            NSAssert(obj.count >= count, @"tabBar数据源个数设置有问题");
        }
    }];
}

#pragma mark - Property
- (NSArray *)classArr {
    return @[@"UIViewController",
             @"UIViewController",
             @"UIViewController",
             @"UIViewController"];
}

- (NSArray *)titlesArr {
    return @[@"首页",
             @"推荐",
             @"热播",
             @"我的"];
}

- (NSArray *)normalImgsArr {
    return @[@"t-09-1",
             @"t-10-1",
             @"t-11-1",
             @"t-12-1"];
}

- (NSArray *)selectedImgsArr {
    return @[@"t-09-2",
             @"t-10-2",
             @"t-11-2",
             @"t-12-2"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
