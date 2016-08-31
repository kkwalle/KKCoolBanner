//
//  KKCoolBannerCell.m
//  KKCoolBanner
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

#import "KKCoolBannerCell.h"

@interface KKCoolBannerCell()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImage *image;
@end

@implementation KKCoolBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.clipsToBounds = YES;
        [self.contentView addSubview:self.imageView];
        NSLog(@"====%@", self);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

- (void)updateWithImage:(UIImage *)image {
    self.image = image;
    self.imageView.image = image;
}

@end
