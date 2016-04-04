//
//  LXSlider.m
//  LXSlider
//
//  Created by linx on 16/4/4.
//  Copyright © 2016年 linx. All rights reserved.
//

#import "LXSlider.h"

@interface LXSlider ()

@property (nonatomic, strong) UIView* view1;

@end

@implementation LXSlider

- (UIView*)view1 {
    if (!_view1) {
        _view1 = [[UIView alloc] init];
        _view1.backgroundColor = [UIColor redColor];
    }

    return _view1;
}

- (instancetype)init {
    if (self = [super init]) {

    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.view1];

        [self setupContraints];
    }

    return self;
}

- (void)setupContraints {
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
