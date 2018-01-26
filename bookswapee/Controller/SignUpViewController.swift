//
//  SignUpViewController.swift
//  bookswapee
//
//  Created by Apple on 11/5/1396 AP.
//  Copyright © 1396 AP Amin Torabi. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var repass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
  
    @IBAction func signUp(_ sender: Any) {
    }
    
}
