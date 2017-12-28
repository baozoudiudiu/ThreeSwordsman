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
    nav.tabBarItem.image = [UIImage imageNamed:norImg];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImg];
    return nav;
}

- (void)setUpTabBar {
    self.tabBar.tintColor = [UIColor orangeColor];
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
             @"二页",
             @"三页",
             @"四页"];
}

- (NSArray *)normalImgsArr {
    return @[@"",
             @"",
             @"",
             @""];
}

- (NSArray *)selectedImgsArr {
    return @[@"",
             @"",
             @"",
             @""];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
