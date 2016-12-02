//
//  LRChoosePicCell.h
//  LRChoosePicView
//
//  Created by Lorin on 2016/11/25.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import <UIKit/UIKit.h>

//@class LRChoosePicCell;
typedef void (^CellLongPressBlcok) ();

typedef NS_ENUM(NSInteger, PicCellType) {
    PicCellTypeImage = 0,      // normal picture
    PicCellTypeAdd             // the add icon
};

// the add picture icon
#define kAddImageIcon [UIImage imageNamed: @"com_lr_addPlaceholder"]

@interface LRChoosePicCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign, readonly) PicCellType cellType;
@property (nonatomic, copy) CellLongPressBlcok longPressBlock;


/**
 * set method, set cell image

 @param image
 */
- (void)setImage:(UIImage *)image;

@end
