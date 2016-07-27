//
//  MyCell.swift
//  MVCDemo-swift
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var hitLable: UILabel!
    
    override func awakeFromNib() {
        layoutMargins = UIEdgeInsetsZero
    }
}

extension MyCell : TTView {
    func update<T : TTModel>(model: T) -> Bool{
        guard model is CellModel else {
            return false
        }
        
        let m =  model as! CellModel
        
        hitLable.text = m.hit
        
        return true
    }
}
