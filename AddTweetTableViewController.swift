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


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onDoneButtonTapped(sender: AnyObject) {

        self.performSegueWithIdentifier("finishAddingSegue", sender: self)
    }



}