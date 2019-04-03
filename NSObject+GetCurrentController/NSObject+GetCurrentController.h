//
//  NSObject+GetCurrentController.h
//  GetCurrentController
//
//  Created by 郑晗 on 2019/3/22.
//  Copyright © 2019年 郑晗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (GetCurrentController)

- (UIViewController *)getCurrentViewController;

@end

NS_ASSUME_NONNULL_END
