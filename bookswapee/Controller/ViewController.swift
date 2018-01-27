//
//  ViewController.swift
//  bookswapee
//
//  Created by Apple on 11/5/1396 AP.
//  Copyright © 1396 AP Amin Torabi. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
 
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func signIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: userName.text!, password:password.text!) { (user,error) in
            if error != nil {
                let alert = UIAlertController(title: "NOTICE", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
               self.performSegue(withIdentifier: "goToProfile", sender: self)
            }
        }
    }
    
    
   
}

