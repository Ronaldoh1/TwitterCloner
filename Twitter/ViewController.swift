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


    override func viewDidAppear(animated: Bool) {
        if ref.authData != nil {
             self.performSegueWithIdentifier("loginAndSignupComplete" , sender: self)

        }else{

            println("You will have to sign in")
        }
    }

    @IBAction func signInButton(sender: AnyObject) {

        if emailText.text == "" || passwordText.text == "" {

            println("Please make sure that you enter an email and a password")


        }else{

            ref.authUser(emailText.text, password: passwordText.text, withCompletionBlock: { (error, authData) -> Void in

                if error != nil {
                    println(error)
                    println("There is an error with the given informatin")
                }else{

                    self.performSegueWithIdentifier("loginAndSignupComplete" , sender: self)

                    println("login success")
                }
            })

        }


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

                    self.ref.authUser(self.emailText.text, password: self.passwordText.text, withCompletionBlock: { (error, authData) -> Void in
                        if error != nil {

                            println( "there is an error with your given information")

                        }else {
                            var userId = authData.uid
                            let newUser = ["provider": authData.provider,
                                "email" : authData.providerData["email"] as? NSString as! String,
                                "post": ""
                            ]

                            let fakePost = [
                            "\(NSDate())": "This is my first post fake post"



                            ]

                            self.ref.childByAppendingPath("Users").childByAppendingPath(authData.uid).setValue(newUser)
                            self.ref.childByAppendingPath("Users/\(authData.uid)/post").setValue(fakePost)


                            self.performSegueWithIdentifier("loginAndSignupComplete" , sender: self)


                         }

                    })

                }

            })

        }




        
    }
}

