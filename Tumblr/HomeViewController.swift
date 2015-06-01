//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/28/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
	@IBOutlet weak var scrollView: UIScrollView!
	
	let transition = LoginAnimator()
	
	var loginViewController: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		scrollView.contentSize = CGSize(width: 320, height: 568)
		
		var storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! UIViewController

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
		var destinationVC = segue.destinationViewController as! UIViewController
		destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
		destinationVC.transitioningDelegate = self
	}
	
	
	@IBAction func didPressLoginButton(sender: AnyObject) {
		loginViewController.transitioningDelegate = self
		presentViewController(loginViewController, animated: true, completion: nil)
	}
	
	func animationControllerForPresentedController(
		presented: UIViewController!,
		presentingController presenting: UIViewController!,
		sourceController source: UIViewController!) ->
		UIViewControllerAnimatedTransitioning! {
			return transition
	}
	func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
		return transition
	}

	
//	extension ViewController: UIViewControllerTransitioningDelegate{
//		
//	}
}
