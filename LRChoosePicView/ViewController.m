//
//  ViewController.m
//  LRChoosePicView
//
//  Created by Lorin on 16/6/23.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import "ViewController.h"
#import "LRChoosePicView.h"

@interface ViewController ()<LRChoosePicViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet LRChoosePicView *choosePicView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *chooseViewHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [_choosePicView addImage: [UIImage imageNamed: @"sensei"]];
    _chooseViewHeight.constant = [_choosePicView actualHeight];
    _choosePicView.delegate = self;
}

#pragma mark - LRChoosePicView Delegate
- (void)choosePicViewAddButtonClicked:(LRChoosePicView *)choosePicView
{
    // on add button action
    NSLog(@"Add");
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    [self presentViewController: imagePicker animated: YES completion:^{
        
    }];
}

- (void)choosePicView:(LRChoosePicView *)choosePicView cellClickedAtIndex:(NSInteger)index image:(UIImage *)image
{
    // on image tapped action
    NSLog(@"image");
}

- (void)choosePicView:(LRChoosePicView *)choosePicView cellLongPressedAtIndex:(NSInteger)index
{
    // on image long press action
    NSLog(@"long press");
}

#pragma mark - UIImgaePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated: YES completion: nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [_choosePicView addImage: image];
    _chooseViewHeight.constant = [_choosePicView actualHeight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
