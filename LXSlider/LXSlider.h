//
//  LXSlider.h
//  LXSlider
//
//  Created by linx on 16/4/4.
//  Copyright © 2016年 linx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXSlider : UIControl

@property (assign, nonatomic) NSUInteger        currentIndex;

@property (copy, nonatomic)   NSMutableArray*   labels;

@property (nonatomic, assign) NSUInteger        handleCount;
@property (nonatomic, strong) UIColor*          handleColor;
@property (nonatomic, strong) UIColor*          handleBackgroundColor;
@property (nonatomic, strong) UIColor*          bannerBackgroundColor;
@property (nonatomic, strong) UIColor*          labelsColor;


@end
