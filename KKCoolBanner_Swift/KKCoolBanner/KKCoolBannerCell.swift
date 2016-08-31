//
//  KKCoolBannerCell.swift
//  KKCoolBanner
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

import UIKit

class KKCoolBannerCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView.init()
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.contentView.addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = self.contentView.bounds
    }
    
    //update image
    public func updateWithImage(image: UIImage) {
        self.image = image
        imageView?.image = image
    }
}
