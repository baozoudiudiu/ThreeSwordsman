//
//  WMHomePageViewController.m
//  wolfmovie
//
//  Created by chenwang on 2017/12/29.
//  Copyright © 2017年 ChenWang. All rights reserved.
//

#import "WMHomePageViewController.h"

@interface WMHomePageViewController ()

@end

@implementation WMHomePageViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNavigationItem:nil];
    [self.magicView reloadData];
}

#pragma mark - VTMagicViewDelegate
/**
 *  视图控制器显示到当前屏幕上时触发
 *
 *  @param magicView      self
 *  @param viewController 当前页面展示的控制器
 *  @param pageIndex      当前控控制器对应的索引
 */
- (void)magicView:(VTMagicView *)magicView viewDidAppear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    
}

/**
 *  视图控制器从屏幕上消失时触发
 *
 *  @param magicView      self
 *  @param viewController 消失的视图控制器
 *  @param pageIndex      消失的控制器对应的索引
 */
- (void)magicView:(VTMagicView *)magicView viewDidDisappear:(__kindof UIViewController *)viewController atPage:(NSUInteger)pageIndex {
    
}

/**
 *  选中导航菜单item时触发
 *
 *  @param magicView self
 *  @param itemIndex menuItem对应的索引
 */
- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    
}

#pragma mark - VTMagicViewDataSource
/**
 *  获取所有菜单名，数组中存放字符串类型对象
 *
 *  @param magicView self
 *
 *  @return header数组
 */
- (NSArray<__kindof NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    return @[
             @"热门",
             @"营销",
             @"搞笑",
             @"装逼",
             @"爱情",
             @"财经",
             @"汽车",
             @"科技",
             @"娱乐"];
}

/**
 *  根据itemIndex加载对应的menuItem
 *
 *  @param magicView self
 *  @param itemIndex 需要加载的菜单索引
 *
 *  @return 当前索引对应的菜单按钮
 */
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    
    UIButton *button = [magicView dequeueReusableItemWithIdentifier:@"buttonId"];
    if(!button) {
        button =  [self createItemButton];
    }
    return button;
}

/**
 *  根据pageIndex加载对应的页面控制器
 *
 *  @param magicView self
 *  @param pageIndex 需要加载的页面索引
 *
 *  @return 页面控制器
 */
- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    NSString *idString = [NSString stringWithFormat:@"%lu", (unsigned long)pageIndex];
    UIViewController *contentVC = [magicView dequeueReusablePageWithIdentifier:idString];
    if(!contentVC) {
        contentVC = [self createContentViewController];
//        contentVC.mainController = self;
    }
    return contentVC;
}

#pragma mark - LogicHelper
- (UIButton *)createItemButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    return button;
}

- (UIViewController *)createContentViewController {
    UIViewController *vc = [[UIViewController alloc] init];
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
