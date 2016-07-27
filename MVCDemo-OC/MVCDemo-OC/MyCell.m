//
//  MyCell.m
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import "MyCell.h"
#import "Header.h"
#import "CellModel.h"

@interface MyCell()
@property (weak, nonatomic) IBOutlet UILabel *hitLabel;

@end

@implementation MyCell

- (BOOL)update:(id<TTModel>)model{
    if ([model isKindOfClass:[CellModel class]]) {
        CellModel *m = model;
        self.hitLabel.text = [m hit];
        return YES;
    }
    return NO;
}

@end
