//
//  AddBookViewController.m
//  JiDianZhang
//
//  Created by gozap on 2019/6/4.
//  Copyright © 2019 com.longdai. All rights reserved.
//

#import "AddBookViewController.h"
#import "SPPageMenu.h"
#import "SpendViewController.h"
#import "IncomeViewController.h"

@interface AddBookViewController ()<SPPageMenuDelegate, UIScrollViewDelegate>
@property (nonatomic, weak) SPPageMenu *pageMenu;
@property (nonatomic, strong) NSArray *titleDataArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *myChildViewControllers;
@end

@implementation AddBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [LCColor backgroudColor];
    self.titleDataArray = @[@"支出",@"收入"];
    SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 0, 128, ScreenHeight) trackerStyle:SPPageMenuTrackerStyleNothing];
    [pageMenu setItems:self.titleDataArray selectedItemIndex:0];
    pageMenu.selectedItemZoomScale = 1.2;
    pageMenu.delegate = self;
    pageMenu.bridgeScrollView = self.scrollView;
    pageMenu.backgroundColor = [LCColor backgroudColor];
    pageMenu.dividingLine.hidden = YES;
    pageMenu.selectedItemTitleColor = [LCColor LCColor_77_92_127];
    pageMenu.unSelectedItemTitleColor = [LCColor LCColor_113_120_150];
    pageMenu.itemTitleFont = LCFont(17);
    self.navigationItem.titleView = pageMenu;
    _pageMenu = pageMenu;
    
    [self.view addSubview:self.scrollView];
    
    NSArray *controllerClassNames = [NSArray arrayWithObjects:@"SpendViewController",@"IncomeViewController", nil];
    for (int i = 0; i < self.titleDataArray.count; i++) {
        if (controllerClassNames.count > i) {
            UIViewController *baseVc = [[NSClassFromString(controllerClassNames[i]) alloc] init];
            baseVc.title = [self.pageMenu contentForItemAtIndex:i];
            [self addChildViewController:baseVc];
            [self.myChildViewControllers addObject:baseVc];
        }
    }
    // pageMenu.selectedItemIndex就是选中的item下标
    if (self.pageMenu.selectedItemIndex < self.myChildViewControllers.count) {
        UIViewController *baseVc = self.myChildViewControllers[self.pageMenu.selectedItemIndex];
        [self.scrollView addSubview:baseVc.view];
        baseVc.view.frame = CGRectMake(ScreenWidth*self.pageMenu.selectedItemIndex, 0, ScreenWidth, ScreenHeight);
        self.scrollView .contentOffset = CGPointMake(ScreenWidth*self.pageMenu.selectedItemIndex, 0);
        self.scrollView .contentSize = CGSizeMake(self.titleDataArray.count*ScreenWidth, 0);
    }
}

#pragma mark - SPPageMenu的代理方法
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index {
    NSLog(@"%zd",index);
}

- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    NSLog(@"%zd------->%zd",fromIndex,toIndex);
//如果该代理方法是由拖拽self.scrollView而触发，说明self.scrollView已经在用户手指的拖拽下而发生偏移，此时不需要再用代码去设置偏移量，否则在跟踪模式为SPPageMenuTrackerFollowingModeHalf的情况下，滑到屏幕一半时会有闪跳现象。闪跳是因为外界设置的scrollView偏移和用户拖拽产生冲突
    if (!self.scrollView.isDragging) { // 判断用户是否在拖拽scrollView
        // 如果fromIndex与toIndex之差大于等于2,说明跨界面移动了,此时不动画.
        if (labs(toIndex - fromIndex) >= 2) {
            [self.scrollView setContentOffset:CGPointMake(ScreenWidth * toIndex, 0) animated:NO];
        } else {
            [self.scrollView setContentOffset:CGPointMake(ScreenWidth * toIndex, 0) animated:YES];
        }
    }
    if (self.myChildViewControllers.count <= toIndex) {return;}
    UIViewController *targetViewController = self.myChildViewControllers[toIndex];
    // 如果已经加载过，就不再加载
    if ([targetViewController isViewLoaded]) return;
    targetViewController.view.frame = CGRectMake(ScreenWidth * toIndex, 0, ScreenWidth, ScreenHeight);
    [_scrollView addSubview:targetViewController.view];
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return  _scrollView;
}

- (NSMutableArray *)myChildViewControllers {
    if (!_myChildViewControllers) {
        _myChildViewControllers = [NSMutableArray array];
    }
    return _myChildViewControllers;
}

- (void)dealloc {
    NSLog(@"父控制器被销毁了");
}
@end
