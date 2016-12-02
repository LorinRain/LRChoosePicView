//
//  LRChoosePicCell.m
//  LRChoosePicView
//
//  Created by Lorin on 2016/11/25.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import "LRChoosePicCell.h"

@implementation LRChoosePicCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if(self) {
        _imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _imageView.backgroundColor = [UIColor redColor];
        [self addSubview: _imageView];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image
{
    if(image == nil) {
        _imageView.image = kAddImageIcon;
        _cellType = PicCellTypeAdd;
    } else {
        _imageView.image = image;
        _cellType = PicCellTypeImage;
    }
}

@end
