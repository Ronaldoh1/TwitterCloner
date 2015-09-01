//
//  ViewController.swift
//  Twitter
//
//  Created by Ronald Hernandez on 9/1/15.
//  Copyright (c) 2015 Wahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    var ref = Firebase (url: "https://twittercloner.firebaseio.com/")

    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInButton(sender: AnyObject) {


    }

    @IBAction func signUp(sender: AnyObject) {


        if emailText.text == "" || passwordText.text == ""{

            println("Please make sure that you enter an email and a password")

        }else {


            ref.createUser(emailText.text, password: passwordText.text, withValueCompletionBlock: { (error, result) -> Void in

                if error != nil {
                    println(error)
                }else{

                    println("Success sign up")

                }

            })

        }




        
    }
}

