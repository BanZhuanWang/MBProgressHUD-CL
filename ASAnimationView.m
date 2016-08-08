//
//  ASAnimationView.m
//  Security
//
//  Created by jinkelei on 13-5-9.
//
//

#import "ASAnimationView.h"

static ASAnimationView *instance = nil;

@implementation ASAnimationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}


+ (void)startAnimationWithMessage:(NSString *)message withDim:(BOOL)bDim inView:(UIView *)view
{
    if (view)
    {
        if (instance)
        {
            if (instance.isLoading)
            {
                return;
            }
            [instance hideAnimated:YES];
            [instance removeFromSuperview];
            instance = nil;
        }
        instance = [[ASAnimationView alloc]initWithView:view];
        instance.label.text = message;
        instance.backgroundView.color = bDim ? [UIColor colorWithWhite:0.f alpha:.2f] : [UIColor clearColor];
        [view addSubview:instance];
        [instance showAnimated:YES];
        instance.isLoading = YES;
    }
}

+ (void)startAnimationInWindowWithMessage:(NSString *)message
                                  withDim:(BOOL)bDim
{
    if (instance)
    {
        if (instance.isLoading)
        {
            return;
        }
        [instance hideAnimated:YES];
        [instance removeFromSuperview];
        instance = nil;
    }
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    instance = [[ASAnimationView alloc]initWithView:window];
    instance.label.text = message;
    instance.backgroundView.color = bDim ? [UIColor colorWithWhite:0.f alpha:.2f] : [UIColor clearColor];
    [window addSubview:instance];
    [instance showAnimated:YES];
    instance.isLoading = YES;
}

+ (void)startAnimationWithOnlyText:(NSString *)text inView:(UIView *)view
{
    if (instance)
    {
        if (instance.isLoading)
        {
            return;
        }
        [instance hideAnimated:YES];
        [instance removeFromSuperview];
        instance = nil;
    }
    instance = [[ASAnimationView alloc]initWithView:view];
    instance.mode = MBProgressHUDModeText;

    instance.label.text = text;
    [view addSubview:instance];
    [instance showAnimated:YES];
    instance.isLoading = YES;
}

+ (void)startAnimationWithCustomView:(UIView *)customView duration:(CGFloat)duration inView:(UIView *)view withDim:(BOOL)bDim
{
    if (instance)
    {
        [instance hideAnimated:YES];
        [instance removeFromSuperview];
        instance = nil;
    }
    instance = [[ASAnimationView alloc]initWithView:view];
    instance.customView = customView;
    instance.backgroundView.color = bDim ? [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1.0f] : [UIColor clearColor];
    instance.mode = MBProgressHUDModeCustomView;
    [view addSubview:instance];
    [instance showAnimated:YES];
    [instance hideAnimated:YES afterDelay:duration];
    
}

+ (void)startAnimationWithCustomView:(UIView *)customView
                              inView:(UIView *)view
                             withDim:(BOOL)bDim
{
    if (instance)
    {
        [instance hideAnimated:YES];
        [instance removeFromSuperview];
        instance = nil;
    }
    instance = [[ASAnimationView alloc]initWithView:view];
    instance.customView = customView;
    instance.bezelView.color = [UIColor clearColor];
    instance.backgroundView.color = bDim ? [UIColor colorWithRed:248 / 255.0 green:248 / 255.0 blue:248 / 255.0 alpha:1.0f] : [UIColor clearColor];
    instance.mode = MBProgressHUDModeCustomView;
    [view addSubview:instance];
    [instance showAnimated:YES];
    instance.isLoading = YES;
}

+ (void)startAnimationWithOnlyText:(NSString *)text duration:(CGFloat)duration inView:(UIView *)view
{
    if (instance)
    {
        [instance hideAnimated:YES];
        [instance removeFromSuperview];
        instance = nil;
    }
    instance = [[ASAnimationView alloc]initWithView:view];
    instance.mode = MBProgressHUDModeText;
    instance.margin = 10;
    instance.label.text = text;
    instance.bezelView.color = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.5];
    instance.removeFromSuperViewOnHide = YES;
    [view addSubview:instance];
    [instance showAnimated:YES];
    [instance hideAnimated:YES afterDelay:duration];
}

+ (void)stopAnimation
{
    if (!instance) {
        return;
    }
    [instance hideAnimated:NO];
    instance.isLoading = NO;
    [instance removeFromSuperview];
    instance = nil;
}

+ (bool)hasAnimationWindow
{
    return instance && instance.isLoading;
}

@end
