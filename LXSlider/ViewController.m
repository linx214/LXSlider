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
        make.edges.equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
