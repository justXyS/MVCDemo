//
//  UIView+Model.h
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTModel;

@protocol TTView <NSObject>

@optional
- (BOOL)update:(id<TTModel>)model;

@end

@interface UIView (Model) <TTView>

@end
