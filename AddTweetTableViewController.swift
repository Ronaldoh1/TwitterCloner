//
//  AddTweetTableViewController.swift
//  
//
//  Created by Ronald Hernandez on 9/1/15.
//
//


import UIKit
class AddTweetTableViewController : UITableViewController{

    @IBOutlet weak var messageText: UITextField!

    var ref = Firebase(url: "https://twittercloner.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onDoneButtonTapped(sender: AnyObject) {



        self.ref.childByAppendingPath("Post").childByAutoId().setValue(messageText.text)

        self.ref.childByAppendingPath("Users/\(ref.authData.uid)/post").childByAutoId().setValue(messageText.text)
        self.performSegueWithIdentifier("finishAddingSegue", sender: self)
    }



}