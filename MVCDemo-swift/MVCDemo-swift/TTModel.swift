//
//  TTModel.swift
//  MVCDemo-swift
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

import Foundation

protocol TTModel {
    func give<T: TTView>(view: T) -> Bool
    
}

extension TTModel {
    func give<T: TTView>(view: T) -> Bool{
        return view .update(self)
    }
}
