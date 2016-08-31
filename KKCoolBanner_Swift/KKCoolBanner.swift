//
//  KKCoolBanner.swift
//  KKCoolBanner
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

import UIKit

class KKCoolBanner: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // 常量定义
    let cellIdentifier = "cellIdentifier"
    // data
    var images = [UIImage]()
    // view
    var imageCollectionView: UICollectionView?

    
    // initial method
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: self.bounds.size.width, height: self.bounds.size.height)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        imageCollectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        imageCollectionView?.isPagingEnabled = true
        imageCollectionView?.dataSource = self
        imageCollectionView?.delegate = self
        imageCollectionView?.register(KKCoolBannerCell.self, forCellWithReuseIdentifier: cellIdentifier)
        imageCollectionView?.contentOffset = CGPoint.init(x: frame.size.width, y: 0)
        self.addSubview(imageCollectionView!)
    }
    
    //便利构造器
    convenience init(frame: CGRect, images: [UIImage]) {
        self.init(frame: frame)
        self.images = images
        imageCollectionView?.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageCollectionView?.frame = self.bounds
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images.count)+2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! KKCoolBannerCell
        var image: UIImage?
        if 0 == indexPath.row { // 第一个 imageView, 最后一张图
            image = images[images.count-1]
        } else if images.count+2-1 == indexPath.row {    //最后一个 View, 第一张图
            image = images[0]
        } else {
            image = images[indexPath.row-1]
        }
        if let sureImage = image {
            cell.updateWithImage(image: sureImage)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
        //重新设置偏移量
        let offsetWidth = scrollView.bounds.size.width;
        if 0 == pageIndex {
            scrollView.contentOffset = CGPoint.init(x: offsetWidth * CGFloat(images.count+2-2), y: 0)
        } else if (images.count+2-1 == Int(pageIndex)) {
            scrollView.contentOffset = CGPoint.init(x: offsetWidth, y: 0)
        }
    }
}
