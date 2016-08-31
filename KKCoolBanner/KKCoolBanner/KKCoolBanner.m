//
//  KKCoolBanner.m
//  KKCoolBanner
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

#import "KKCoolBanner.h"
#import "KKCoolBannerCell.h"

static NSString *const cellIdentifier = @"cellIdentifier";

@interface KKCoolBanner() <UICollectionViewDataSource, UICollectionViewDelegate>
//image array
@property (nonatomic, copy) NSArray *images;

//collectionView
@property (nonatomic, strong) UICollectionView *imageCollectionView;
@end

@implementation KKCoolBanner

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //do something
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = frame.size;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.imageCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        self.imageCollectionView.dataSource = self;
        self.imageCollectionView.delegate = self;
        [self.imageCollectionView registerClass:[KKCoolBannerCell class] forCellWithReuseIdentifier:cellIdentifier];
        self.imageCollectionView.pagingEnabled = YES;
        self.imageCollectionView.contentOffset = CGPointMake(frame.size.width, 0);
        [self addSubview:self.imageCollectionView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageCollectionView.frame = self.bounds;
}

// initial method
+ (instancetype)coolBannerWithFrame:(CGRect)frame images:(NSArray *)images {
    KKCoolBanner *banner = [[KKCoolBanner alloc] initWithFrame:frame];
    banner.images = images;
    return banner;
}

// collectionView dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count + 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKCoolBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    //设置图片
    UIImage *image;
    if (0 == indexPath.row) {
        image = self.images.lastObject;
    } else if (self.images.count+2-1 == indexPath.row) {
        image = self.images.firstObject;
    } else {
        image = [self.images objectAtIndex:indexPath.row-1];
    }
    //更新图片
    [cell updateWithImage:image];
    return cell;
}

// scrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger pageIndex = scrollView.contentOffset.x / scrollView.bounds.size.width;
    //重新设置偏移量
    CGFloat offsetWidth = scrollView.bounds.size.width;
    if (0 == pageIndex) {
        scrollView.contentOffset = CGPointMake(offsetWidth * (self.images.count+2-2), 0);
    } else if (self.images.count+2-1 == pageIndex) {
        scrollView.contentOffset = CGPointMake(offsetWidth, 0);
    }
}

@end
