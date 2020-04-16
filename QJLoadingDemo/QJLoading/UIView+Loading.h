////
// QJLoadingDemo
// Created by: ___XQJ___ on 2020/4/13
 

#import <UIKit/UIKit.h>
/**
 *  回调block   callback block
 */
typedef void (^QJLoadingCompleteBlock) (void);



@interface UIView (Loading)

/**
 展示loading（默认背景为黑色,图标白色,默认文字:加载中）
 */
- (void)qj_showLoading;

/**
 展示loading（默认背景黑色,图标白色,文字自定义）
 */
- (void)qj_showLoading:(NSString *)text;

/**
 展示指定颜色的loading
 @param loadingColor loading的颜色
 @param backgroundColor loading的背景色
 @param text  提示文字内容
 */
- (void)qj_showLoadingWithLoadingColor:(UIColor *)loadingColor
                       backgroundColor:(UIColor *)backgroundColor text:(NSString *)text;
/**
 展示加载成功(默认背景为黑色,图标白色)
 */
- (void)qj_showSucess:(NSString *)text completeBlock:(QJLoadingCompleteBlock)completeBlock;

/**
 展示加载成功
 */
- (void)qj_showSucess:(NSString *)text
         loadingColor:(UIColor *)loadingColor
      backgroundColor:(UIColor *)backgroundColor
      completeBlock:(QJLoadingCompleteBlock)completeBlock;

/**
 展示加载失败(默认背景为黑色,图标白色)
*/
- (void)qj_showFail:(NSString *)text completeBlock:(QJLoadingCompleteBlock)completeBlock;

/**
 展示加载成功
 */
- (void)qj_showFail:(NSString *)text
         loadingColor:(UIColor *)loadingColor
      backgroundColor:(UIColor *)backgroundColor
      completeBlock:(QJLoadingCompleteBlock)completeBlock;

/**
 移除loading
 */
- (void)qj_removeLoading;


@end

