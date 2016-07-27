//
//  ViewController.h
//  MVCDemo-OC
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@interface ViewController : UIViewController

@end


@interface ViewController(TableViewDelegate) <UITableViewDelegate,UITableViewDataSource>

@end

