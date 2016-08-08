//
//  ASAnimationView.h
//  Security
//
//  Created by jinkelei on 13-5-9.
//
//
//   在试用ASAnimation的ViewController的dealloc中使用stopAnimation是一个好习惯，防止内存泄露

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface ASAnimationView : MBProgressHUD
{
    BOOL _isLoading;
}
@property(assign, nonatomic) BOOL isLoading;


+ (void)startAnimationWithMessage:(NSString *)message
                          withDim:(BOOL)bDim
                           inView:(UIView *)view;

+ (void)startAnimationInWindowWithMessage:(NSString *)message
                          withDim:(BOOL)bDim;

+ (void)startAnimationWithOnlyText:(NSString *)text
                            inView:(UIView *)view;

+ (void)startAnimationWithCustomView:(UIView *)customView
                            duration:(CGFloat)duration
                              inView:(UIView *)view
                             withDim:(BOOL)bDim;

+ (void)startAnimationWithCustomView:(UIView *)customView
                              inView:(UIView *)view
                             withDim:(BOOL)bDim;

+ (void)startAnimationWithOnlyText:(NSString *)text duration:(CGFloat)duration inView:(UIView *)view;

+ (void)stopAnimation;

+ (bool)hasAnimationWindow;
@end
