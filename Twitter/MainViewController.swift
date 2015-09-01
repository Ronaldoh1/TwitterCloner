//
//  MainViewController.swift
//  Twitter
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 Wahoo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var ref = Firebase(url: "https://twittercloner.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logout(sender: AnyObject) {

        self.ref.unauth()

        self.performSegueWithIdentifier("logoutSegue", sender: self)   
    }

}
