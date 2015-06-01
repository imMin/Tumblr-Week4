//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/31/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var loginForm: UIView!
	
	let transition = LoginAnimator()
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		modalPresentationStyle = UIModalPresentationStyle.Custom
		transitioningDelegate = self
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		emailField.becomeFirstResponder()
	}
	
	@IBAction func didClickCancel(sender: AnyObject) {
		view.endEditing(true)
		dismissViewControllerAnimated(true, completion: nil)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
