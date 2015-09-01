//
//  MainViewController.swift
//  Twitter
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 Wahoo. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var ref = Firebase(url: "https://twittercloner.firebaseio.com/")

    var post: [String] = ["hello", "hello", "3"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return post.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell

        cell.textLabel!.text = self.post[indexPath.row]

        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return  1;
    }

    @IBAction func logout(sender: AnyObject) {

        self.ref.unauth()

        self.performSegueWithIdentifier("logoutSegue", sender: self)   
    }

}
