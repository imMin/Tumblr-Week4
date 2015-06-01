//
//  LoginAnimator.swift
//  Tumblr
//
//  Created by Min Hu on 5/31/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class LoginAnimator: NSObject, UIViewControllerAnimatedTransitioning{
	
	let duration = 0.2
	var isPresenting: Bool = true
	
	
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning)-> NSTimeInterval {
		return duration
	}
	
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		var containerView = transitionContext.containerView()
		var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
		var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
		
		if (isPresenting) {
			containerView.addSubview(toViewController.view)
			toViewController.view.alpha = 0
			
			UIView.animateWithDuration(duration, animations: { () -> Void in
				toViewController.view.alpha = 1
				}) { (finished: Bool) -> Void in
					transitionContext.completeTransition(true)
					self.isPresenting = false
			}
		} else {
			UIView.animateWithDuration(duration, animations: { () -> Void in
				fromViewController.view.alpha = 0
				}) { (finished: Bool) -> Void in
					transitionContext.completeTransition(true)
					fromViewController.view.removeFromSuperview()
					self.isPresenting = true
			}
		}
	}
	
}
