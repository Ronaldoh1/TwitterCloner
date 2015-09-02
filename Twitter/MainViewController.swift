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

    var posts: [String: String] = [String: String]()


    override func viewDidLoad() {
        super.viewDidLoad()

        ref.observeEventType(.Value, withBlock: { (snapshot) -> Void in

            println(snapshot.value.objectForKey("Post"))
            self.posts = snapshot.value.objectForKey("Post") as! [String: String]
            self.tableView.reloadData()
        })

    }

     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.posts.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell

        var keys: Array = Array(self.posts.keys)




        cell.textLabel!.text = posts[keys[indexPath.row]] as String!

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
