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
        
        // Add long press gesture
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget: self action: @selector(cellLongPressAction:)];
        [self addGestureRecognizer: longPress];
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

- (void)cellLongPressAction:(UILongPressGestureRecognizer *)longPress
{
    if(_cellType == PicCellTypeImage) {
        if(longPress.state == UIGestureRecognizerStateBegan) {
            if(self.longPressBlock) {
                self.longPressBlock();
            }
        }
    }
}

@end
