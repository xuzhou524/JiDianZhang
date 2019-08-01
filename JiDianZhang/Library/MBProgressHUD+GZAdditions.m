//
//  MBProgressHUD+GZAdditions.m
//  LongDai
//
//  Created by gozap on 2019/7/4.
//  Copyright © 2019 Gozap. All rights reserved.
//

#import "MBProgressHUD+GZAdditions.h"

@implementation MBProgressHUD (GZAdditions)

- (NSTimeInterval)displayDurationForString:(NSString*)string{
    float lenght = [string lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    return MIN(lenght*0.06 + 0.3, 5.0);
}

+ (void)showIndicatorMessage:(NSString *)message {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    [MBProgressHUD hideHUDForView:keyWindow animated:YES];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.font = LCFont2(16);
    hud.detailsLabel.text = message;
    hud.userInteractionEnabled = NO;
    hud.minShowTime = 1.5;
    [hud hideAnimated:YES afterDelay:2.0];
}

@end
