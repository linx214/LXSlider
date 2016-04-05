//
//  ViewController.m
//  LXSlider
//
//  Created by linx on 16/4/3.
//  Copyright © 2016年 linx. All rights reserved.
//

#import "ViewController.h"
#import "LXSlider.h"

@interface ViewController ()
@property (nonatomic, strong) LXSlider* slider;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _slider = [[LXSlider alloc] init];
    [self.view addSubview:_slider];
    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.height.equalTo(@60);
    }];

    _slider.handleCount = 5;
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderValueChanged: (LXSlider*)slider {
    NSLog(@"slider.currentIndex: %u", slider.currentIndex);
}

@end
