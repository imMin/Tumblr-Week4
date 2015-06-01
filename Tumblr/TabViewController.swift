//
//  TabViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/28/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class TabViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	
	@IBOutlet weak var homeButton: UIButton!
	@IBOutlet weak var searchButton: UIButton!
	@IBOutlet weak var composeButton: UIButton!
	@IBOutlet weak var accountButton: UIButton!
	@IBOutlet weak var trendingButton: UIButton!
	@IBOutlet weak var exploreView: UIImageView!
	
	var homeViewController: UIViewController!
	var searchViewController: UIViewController!
	var composeViewController: UIViewController!
	var accountViewController: UIViewController!
	var trendingViewController: UIViewController!
	var selectedButton: UIButton!
	var selectedViewController: UIViewController!
	var viewControllers: [UIViewController]!
	var buttons: [UIButton]!
	let transition = composeAnimator()
	


    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		var storyboard = UIStoryboard(name: "Main", bundle: nil)
		
		homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
		searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
		composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
		accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
		trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController
		
		viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
		buttons = [homeButton, searchButton, accountButton, trendingButton]
		
		
		loadContentView(homeViewController)
		homeButton.selected = true
		
		UIView.animateWithDuration(1.5, delay: 0.1, options: .Repeat | .Autoreverse, animations: { () -> Void in
			self.exploreView.center.y += 8
		}, completion: nil)
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//Decide current selected button and view controller
	@IBAction func currentPressedButton(sender: UIButton){
		for(var i = 0; i < 4; i++){
			if (sender.tag == i){
				setButtons()
				selectedButton = buttons[i]
				selectedViewController = viewControllers[i]
				selectedButton.selected = true
				for view in contentView.subviews{
					view.removeFromSuperview()
				}
				loadContentView(selectedViewController)
			}
		}
		if sender.tag == 1 {
			exploreView.alpha = 0
		}
		else {
			exploreView.alpha = 1
		}
	}
	
	func setButtons(){
		for i in 0 ..< 4 {
			buttons[i].selected = false
		}
	}
	
	
	func loadContentView(ViewController: UIViewController){
		addChildViewController(ViewController)
		ViewController.view.frame = contentView.bounds
		contentView.addSubview(ViewController.view)
		ViewController.didMoveToParentViewController(self)
	}

	
	@IBAction func didPressComposeButton(sender: AnyObject) {
		composeViewController.transitioningDelegate = self
		presentViewController(composeViewController, animated: true, completion: nil)
		
	}
	
	func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
			return transition
	}
	
	func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		return transition
	}
}
