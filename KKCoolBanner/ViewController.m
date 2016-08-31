//
//  ViewController.m
//  KKCoolBanner
//
//  Created by kkwalle on 16/8/28.
//  Copyright © 2016年 kkwalle. All rights reserved.
//

#import "ViewController.h"
#import "KKCoolBanner.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation ViewController

- (NSMutableArray *)images {
    if (!_images) {
        _images = [NSMutableArray array];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 5; i++) {
        NSString *picName = [NSString stringWithFormat:@"banner_pic_%d", i];
        UIImage *image = [UIImage imageNamed:picName];
        [self.images addObject:image];
    }
    
    KKCoolBanner *banner = [KKCoolBanner coolBannerWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100) images:self.images];
    [self.view addSubview:banner];
    
}


@end
