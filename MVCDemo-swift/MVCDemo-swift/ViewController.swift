//
//  ViewController.swift
//  MVCDemo-swift
//
//  Created by xyxxllh on 16/7/27.
//  Copyright © 2016年 XunLei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataList = [TTModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue()) {
            for i in 0...10 {
                let m = CellModel()
                m.hit = "\(i)"
                self.dataList.append(m)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCell
        
        self.dataList[indexPath.row].give(cell)
        
        return cell
    }
}

