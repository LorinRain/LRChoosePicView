//
//  ViewController.m
//  LRChoosePicView
//
//  Created by Lorin on 16/6/23.
//  Copyright © 2016年 LorinRain. All rights reserved.
//

#import "ViewController.h"
#import "LRChoosePicView.h"

@interface ViewController ()<LRChoosePicViewDelegate>

@property (weak, nonatomic) IBOutlet LRChoosePicView *choosePicView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *chooseViewHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    for(int i = 0;i < 8;i++) {
        [_choosePicView addImage: [UIImage imageNamed: @"sensei"]];
    }
    _chooseViewHeight.constant = [_choosePicView actualHeight];
    _choosePicView.delegate = self;
}

- (void)choosePicViewAddButtonClicked:(LRChoosePicView *)choosePicView
{
    NSLog(@"在这里面的新增");
}

- (void)choosePicView:(LRChoosePicView *)choosePicView cellClickedAtIndex:(NSInteger)index image:(UIImage *)image
{
    NSLog(@"在这里面浏览，很好啊");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
