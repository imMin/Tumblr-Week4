//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/28/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
	@IBOutlet weak var loaderImage: UIImageView!
	@IBOutlet weak var trendingImage: UIImageView!
	@IBOutlet weak var loaderBackgroundView: UIView!
	@IBOutlet weak var scrollView: UIScrollView!

	
    override func viewDidLoad() {
        super.viewDidLoad()
		scrollView.contentSize = trendingImage.image!.size
		
		loaderImage.animationImages = [UIImage]()
		
		loaderImage.animationImages?.append(UIImage(named: "loading-1")!)
		loaderImage.animationImages?.append(UIImage(named: "loading-2")!)
		loaderImage.animationImages?.append(UIImage(named: "loading-3")!)
	
		loaderImage.animationDuration = 1
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		loaderBackgroundView.alpha = 1
		loaderImage.startAnimating()
		delay(1.5, closure: { () -> () in
			UIView.animateWithDuration(0.4, animations: { () -> Void in
				self.loaderBackgroundView.alpha = 0
				}, completion: { (Bool) -> Void in
					self.loaderImage.stopAnimating()
			})
		})
	}
	
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
