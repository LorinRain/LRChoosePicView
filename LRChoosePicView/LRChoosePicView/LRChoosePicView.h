//
//  LRChoosePicView.h
//  LRChoosePicView
//
//  Created by Lorin on 16/6/23.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import <UIKit/UIKit.h>

//---------------------------------------------------
// setable definitions

#define kImageNumPerLine 4   // image number each line, sugguest 3 or 4
#define kImageMargin 5       // margin between images

//---------------------------------------------------

@class LRChoosePicView;
@protocol LRChoosePicViewDelegate <NSObject>

@optional

- (void)choosePicView:(LRChoosePicView *)choosePicView cellClickedAtIndex:(NSInteger)index image:(UIImage *)image;  // index, 0 based
- (void)choosePicViewAddButtonClicked:(LRChoosePicView *)choosePicView;
- (void)choosePicView:(LRChoosePicView *)choosePicView cellLongPressedAtIndex:(NSInteger)index;  // index, 0 based

@end

@interface LRChoosePicView : UIView

/**
 * max image count that can be added to the view, default is 9
 */
@property (nonatomic, assign) NSInteger maxImageCount;

/**
 * view's actual height with exist images
 */
@property (nonatomic, assign, readonly) CGFloat actualHeight;

@property (nonatomic, assign) id<LRChoosePicViewDelegate> delegate;

/**
 * current images in the view
 */
@property (nonatomic, strong, readonly) NSMutableArray<UIImage *> *imagesArray;


/**
 * Add a new image to LRChoosePicView

 @param image the image that added to the view
 */
- (void)addImage:(UIImage *)image;


/**
 * Add images from an array

 @param imagesArray array that contains images
 */
- (void)addImagesFromArray:(NSArray<UIImage *> *)imagesArray;


/**
 * Remove a exist image from LRChoosePicView

 @param index the image index at the view
 */
- (void)removeImageAtIndex:(NSInteger)index;


/**
 * remove all images from LRChooseView
 */
- (void)clearImages;

@end
