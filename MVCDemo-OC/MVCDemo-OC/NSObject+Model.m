//
//  NSObject+Model.m
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import "NSObject+Model.h"

@implementation NSObject (Model)

- (BOOL)give:(id<TTView>)view {
    return [view update:self];
}

@end
