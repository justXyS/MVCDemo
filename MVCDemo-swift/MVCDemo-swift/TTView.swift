//
//  TTView.swift
//  MVCDemo-swift
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

import Foundation
import UIKit

protocol TTView {
    func update<T:TTModel>(mode: T) -> Bool
}
