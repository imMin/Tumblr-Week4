//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/28/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate {
	
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var textIcon: UIButton!
	@IBOutlet weak var photoIcon: UIButton!
	@IBOutlet weak var quoteIcon: UIButton!
	@IBOutlet weak var linkIcon: UIButton!
	@IBOutlet weak var chatIcon: UIButton!
	@IBOutlet weak var videoIcon: UIButton!
	@IBOutlet weak var iconsLayerView: UIView!
	var icons: [UIButton]!
	var animationDurations: [NSTimeInterval]!
	var animationDelays: [NSTimeInterval]!
	var iconOriginY: [CGFloat]! = [435, 435, 435, 577, 577, 577]
	var moveDistance: CGFloat! = 400
	
	
	let transition = composeAnimator()
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		modalPresentationStyle = UIModalPresentationStyle.Custom
		transitioningDelegate = self
	}
	


    override func viewDidLoad() {
        super.viewDidLoad()
		icons = [textIcon, photoIcon, quoteIcon, linkIcon, chatIcon, videoIcon]
		animationDurations = [0.2, 0.1, 0.15, 0.25, 0.1, 0.25]
		animationDelays = [0.15, 0.0, 0.1, 0.2, 0.0, 0.25]
    }
	

	override func viewWillAppear(animated: Bool) {
		iconsLayerView.alpha = 1
		for (var i = 0; i < 6; i++){
			icons[i].frame.origin.y = iconOriginY[i]
		}
//		backgroundView.alpha = 0.2
		animateUp()
	}

	func animateIcons(duration: NSTimeInterval, delay: NSTimeInterval, button: UIButton){
		UIView.animateWithDuration(duration, delay: delay, options: nil, animations: { () ->
			Void in
			button.frame = CGRectMake(button.frame.origin.x, button.frame.origin.y - self.moveDistance, button.frame.width, button.frame.height)
//			self.view.center.y -= 40
			}, completion: nil)
	}
	
	func animateUp(){
		for (var i = 0; i < 6; i++){
			animateIcons(animationDurations[i], delay: animationDelays[i], button: icons[i])
		}
	}
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
    
	@IBAction func didPressDismissButton(sender: AnyObject) {
		animateUp()
		delay(0.5){
			self.iconsLayerView.alpha = 0
			self.dismissViewControllerAnimated(true, completion: nil)
		}
	}
	
	
	func delay(delay:Double, closure:()->()) {
		dispatch_after(
			dispatch_time(
				DISPATCH_TIME_NOW,
				Int64(delay * Double(NSEC_PER_SEC))
			),
			dispatch_get_main_queue(), closure)
	}
}



