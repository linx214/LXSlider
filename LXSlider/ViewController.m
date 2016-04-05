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
    _slider.frame = CGRectMake(17, 200, 286, 60);
    [self.view addSubview:_slider];

    _slider.handleCount = 5;
    _slider.labels = [[NSArray arrayWithObjects:@"first", @"second", @"third", @"fourth", @"fifth", nil] mutableCopy];
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sliderValueChanged: (LXSlider*)slider {
    NSLog(@"slider.currentIndex: %lu", (unsigned long)slider.currentIndex);
}

@end
