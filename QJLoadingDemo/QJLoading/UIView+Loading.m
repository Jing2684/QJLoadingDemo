////
// QJLoadingDemo
// Created by: ___XQJ___ on 2020/4/13
 

#import "UIView+Loading.h"
#import "QJLoadingView.h"
#import <objc/runtime.h>

static char QJ_ACTIVITY_INDICATOR_KEY;

@implementation UIView (Loading)

- (QJLoadingView *)qj_loadingView{
    return objc_getAssociatedObject(self, &QJ_ACTIVITY_INDICATOR_KEY);
}

- (void)setQj_loadingView:(QJLoadingView *)qj_loadingView{
    objc_setAssociatedObject(self, &QJ_ACTIVITY_INDICATOR_KEY, qj_loadingView, OBJC_ASSOCIATION_RETAIN);
}

/**
 展示loading（默认背景为黑色,图标白色,默认文字:加载中）
 */
- (void)qj_showLoading{
    [self qj_showLoadingWithLoadingColor:[UIColor whiteColor]
                         backgroundColor:[UIColor blackColor] text:@"加载中"];
    
}


/**
 展示loading（默认背景黑色,图标白色,文字自定义）
 */
- (void)qj_showLoading:(NSString *)text{
    [self qj_showLoadingWithLoadingColor:[UIColor whiteColor]
                         backgroundColor:[UIColor blackColor] text:text];
}

/**
 展示指定颜色的loading
 @param loadingColor loading的颜色
 @param backgroundColor loading的背景色
 @param text  提示文字内容
 */
- (void)qj_showLoadingWithLoadingColor:(UIColor *)loadingColor
                       backgroundColor:(UIColor *)backgroundColor text:(NSString *)text
{
    if (self.qj_loadingView) {
        [self.qj_loadingView removeFromSuperview];
        self.qj_loadingView = nil;
    }
    self.qj_loadingView = [[QJLoadingView alloc] initWithFrame:self.bounds];
    [self addSubview:self.qj_loadingView];
    if (loadingColor) {
        self.qj_loadingView.loadingColor = loadingColor;
    }
    if (backgroundColor) {
         self.qj_loadingView.backgroundColor = backgroundColor;
    }
    if (text.length > 0) {
         self.qj_loadingView.text = text;
    }
}

/**
 展示加载成功
 */
- (void)qj_showSucess:(NSString *)text completeBlock:(QJLoadingCompleteBlock)completeBlock{
    text = text.length>0 ? text:@"加载完成";
    [self qj_showLoading:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self qj_removeLoading];
        completeBlock();
    });
}

/**
 展示加载成功
 */
- (void)qj_showSucess:(NSString *)text
         loadingColor:(UIColor *)loadingColor
      backgroundColor:(UIColor *)backgroundColor
        completeBlock:(QJLoadingCompleteBlock)completeBlock{
    text = text.length>0 ? text:@"加载完成";
    [self qj_showLoadingWithLoadingColor:loadingColor backgroundColor:backgroundColor text:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self qj_removeLoading];
        completeBlock();
    });
}


/**
 展示加载失败(默认背景为黑色,图标白色)
*/
- (void)qj_showFail:(NSString *)text completeBlock:(QJLoadingCompleteBlock)completeBlock{
    text = text.length>0 ? text:@"加载失败";
    [self qj_showLoading:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self qj_removeLoading];
        completeBlock();
    });
}

/**
 展示加载成功
 */
- (void)qj_showFail:(NSString *)text
         loadingColor:(UIColor *)loadingColor
      backgroundColor:(UIColor *)backgroundColor
        completeBlock:(QJLoadingCompleteBlock)completeBlock{
    text = text.length>0 ? text:@"加载失败";
    [self qj_showLoadingWithLoadingColor:loadingColor backgroundColor:backgroundColor text:text];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self qj_removeLoading];
        completeBlock();
    });
}

/**
 移除loading
 */
- (void)qj_removeLoading {
    if (self.qj_loadingView) {
        [self.qj_loadingView removeFromSuperview];
        self.qj_loadingView = nil;
    }
}
@end
