//
//  NSObject+Model.h
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+Model.h"

@protocol TTModel <NSObject>

- (BOOL)give:(id<TTView>)view;

@end

@interface NSObject (Model) <TTModel>

@end
