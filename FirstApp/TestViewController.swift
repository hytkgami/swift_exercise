//
//  TestViewController.swift
//  FirstApp
//
//  Created by Hajime Kagami on 2016/02/09.
//  Copyright © 2016年 Hajime Kagami. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var myTable: UITableView!
	@IBOutlet weak var myBtn: UIButton!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
//	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//		<#code#>
//	}
//	
//	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		<#code#>
//	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell = UITableViewCell()
		cell.textLabel?.text = "hoge"
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("hoge")
		print(indexPath.row)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
