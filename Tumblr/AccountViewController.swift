//
//  AccountViewController.swift
//  Tumblr
//
//  Created by Min Hu on 5/28/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var accountImage: UIImageView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		scrollView.contentSize = accountImage.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
