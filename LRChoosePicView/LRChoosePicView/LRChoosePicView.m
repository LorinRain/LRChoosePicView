//
//  LRChoosePicView.m
//  LRChoosePicView
//
//  Created by Lorin on 16/6/23.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import "LRChoosePicView.h"
#import "LRChoosePicCell.h"

@interface LRChoosePicView()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@end

@implementation LRChoosePicView

/*
 If you use LRChoosePicView and linked it with a nib file, plz open below method 'awakeFromNib'
 */
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _imagesArray = [[NSMutableArray alloc] init];
    [self setupCollectionView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    if(self) {
        _imagesArray = [[NSMutableArray alloc] init];
        [self setupCollectionView];
    }
    return self;
}

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout: flowLayout];
    
    flowLayout.minimumLineSpacing = kImageMargin;
    flowLayout.minimumInteritemSpacing = kImageMargin;
    
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass: [LRChoosePicCell class] forCellWithReuseIdentifier: @"cell"];
    
    [self addSubview: _collectionView];
    
    _maxImageCount = 9;
}

#pragma mark - UICollectionView DataSource Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(_imagesArray.count >= _maxImageCount) {
        return _maxImageCount;
    } else {
        return _imagesArray.count + 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRChoosePicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"cell" forIndexPath: indexPath];
    
    if(_imagesArray.count >= _maxImageCount) {
        UIImage *image = _imagesArray[indexPath.row];
        [cell setImage: image];
    } else {
        if(indexPath.row == _imagesArray.count) {
            [cell setImage: nil];
        } else {
            UIImage *image = _imagesArray[indexPath.row];
            [cell setImage: image];
        }
    }
    
    cell.longPressBlock = ^{
        if([self.delegate respondsToSelector: @selector(choosePicView:cellLongPressedAtIndex:)]) {
            [self.delegate choosePicView: self cellLongPressedAtIndex: indexPath.row];
        }
    };
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LRChoosePicCell *cell = (LRChoosePicCell *)[collectionView cellForItemAtIndexPath: indexPath];
    if(cell.cellType == PicCellTypeAdd) {
        if([self.delegate respondsToSelector: @selector(choosePicViewAddButtonClicked:)]) {
            [self.delegate choosePicViewAddButtonClicked: self];
        }
    } else {
        if([self.delegate respondsToSelector: @selector(choosePicView:cellClickedAtIndex:image:)]) {
            [self.delegate choosePicView: self cellClickedAtIndex: indexPath.row image: cell.imageView.image];
        }

    }
}

#pragma mark - UICollectionView FlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemWidth = (CGRectGetWidth(self.frame) - ((kImageNumPerLine - 1) * kImageMargin)) / kImageNumPerLine;
    return CGSizeMake(itemWidth, itemWidth);
}

#pragma mark - Private

#pragma mark - Public
- (void)addImage:(UIImage *)image
{
    if(_imagesArray.count >= _maxImageCount) {
        return;
    }
    [_imagesArray addObject: image];
    [_collectionView reloadData];;
}

- (void)addImagesFromArray:(NSArray<UIImage *> *)imagesArray
{
    for(UIImage *image in imagesArray) {
        [self addImage: image];
    }
}

- (void)removeImageAtIndex:(NSInteger)index
{
    if(index < 0 || index > _imagesArray.count) return;
    
    [_imagesArray removeObjectAtIndex: index];
    [_collectionView reloadData];
}

- (void)clearImages
{
    [_imagesArray removeAllObjects];
    [_collectionView reloadData];
}

- (CGFloat)actualHeight
{
    [self layoutIfNeeded];
    CGFloat itemWidth = (CGRectGetWidth(self.frame) - ((kImageNumPerLine - 1) * kImageMargin)) / kImageNumPerLine;
    NSInteger count = _imagesArray.count;
    if(_imagesArray.count >= _maxImageCount) {
        count = _maxImageCount;
    } else {
        count = _imagesArray.count + 1;
    }
    NSInteger line = count / kImageNumPerLine + (count % kImageNumPerLine == 0 ? 0 : 1);
    return line * itemWidth + kImageMargin * (line - 1);
}

- (void)setMaxImageCount:(NSInteger)maxImageCount
{
    _maxImageCount = maxImageCount;
    if(_imagesArray.count > maxImageCount) {
        [_imagesArray removeObjectsInRange: NSMakeRange(maxImageCount - 1, _imagesArray.count - maxImageCount)];
    }
    [_collectionView reloadData];
}

@end
