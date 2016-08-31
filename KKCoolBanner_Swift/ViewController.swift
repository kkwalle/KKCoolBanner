//
//  ViewController.swift
//  KKCoolBanner_Swift
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for picIndex in 0...4 {
            let imageName = "banner_pic_" + String(picIndex)
            if let image = UIImage.init(named: imageName) {
                images.append(image)
            }
         }
        
        // cool banner
        let coolBanner = KKCoolBanner.init(frame: CGRect.init(x: 0, y: 100, width: self.view.bounds.size.width, height: 100), images: images)
        self.view.addSubview(coolBanner)
    }


}

