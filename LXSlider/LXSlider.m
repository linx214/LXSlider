//
//  LXSlider.m
//  LXSlider
//
//  Created by linx on 16/4/4.
//  Copyright © 2016年 linx. All rights reserved.
//

#import "LXSlider.h"
#import "NSString+PreferredFontSize.h"

@interface LXSlider ()

@property (assign, nonatomic) CGFloat bannerIntervalWidth;
@property (assign, nonatomic) CGFloat bannerNodeRadius;
@property (assign, nonatomic) CGFloat bannerHeight;
@property (assign, nonatomic) CGFloat handleRadius;
@property (assign, nonatomic) CGFloat handleCenterRadius;
@property (assign, nonatomic) CGFloat handleX;
@property (assign, nonatomic) CGFloat handleY;

@end

@implementation LXSlider

- (NSUInteger)handleCount {
    if (_handleCount < 2) {
        _handleCount = 2;
    }

    return _handleCount;
}

- (NSArray*)labels {
    if (!_labels) {
        return nil;
    }

    return _labels;
}

- (UIColor*)handleColor {
    if (!_handleColor) {
        _handleColor = [UIColor whiteColor];
    }

    return _handleColor;
}

- (UIColor*)handleBackgroundColor {
    if (!_handleBackgroundColor) {
        _handleBackgroundColor = [UIColor darkGrayColor];
    }

    return _handleBackgroundColor;
}

- (UIColor*)bannerBackgroundColor {
    if (!_bannerBackgroundColor) {
        _bannerBackgroundColor = [UIColor orangeColor];
    }

    return _bannerBackgroundColor;
}

- (UIColor*)labelsColor {
    if (!_labelsColor) {
        _labelsColor = [UIColor blackColor];
    }

    return _labelsColor;
}

- (instancetype)init {
    if (self = [super init]) {

    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

        [self privateInitial];
    }

    return self;
}

- (void)privateInitial {
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    if (!_bannerIntervalWidth) {
        _bannerIntervalWidth = CGRectGetWidth(rect) / self.handleCount;
    }

    if (!_bannerHeight) {
        _bannerHeight = CGRectGetHeight(rect) / 5;
    }

    if (!_bannerNodeRadius) {
        _bannerNodeRadius = _bannerHeight;
    }

    if (!_handleRadius) {
        _handleRadius = CGRectGetHeight(rect) / 4;
    }

    if (!_handleCenterRadius) {
        _handleCenterRadius = _handleRadius / 3;
    }

    if (!_handleX) {
        _handleX = CGRectGetWidth(rect) / (self.handleCount * 2);
    }

    if (!_handleY) {
        _handleY = CGRectGetHeight(rect) / 2;
    }

    CGContextRef context = UIGraphicsGetCurrentContext();

    // 绘制bannerRect
    [self.bannerBackgroundColor set];
    CGRect bannerRect = CGRectMake(_handleX, _handleY - _bannerHeight / 2, _bannerIntervalWidth * (self.handleCount - 1), _bannerHeight);
    CGContextFillRect(context, bannerRect);

    CGContextSetShadow(context, CGSizeMake(1, 1), 1.0f);

    // 绘制bannerRect节点圆形
    for (int i = 0; i < self.handleCount; ++i) {
        CGRect bannerNodeRect = CGRectMake(_handleX - _bannerNodeRadius + i * _bannerIntervalWidth, _handleY - _bannerNodeRadius, _bannerNodeRadius * 2, _bannerNodeRadius * 2);
        CGContextFillEllipseInRect(context, bannerNodeRect);
    }

    // 绘制labels
    CGSize maxSize = CGSizeMake(_bannerIntervalWidth, (rect.size.height - _handleRadius * 2) / 2);
    for (int i = 0; i < self.labels.count; ++i) {
        CGSize  preferredSize;
        CGFloat preferredFontSize;
        [NSString preferredFontSizeWithString:self.labels[i] maxSize:maxSize preferredFontSize:&preferredSize preferredFont:&preferredFontSize];
        CGPoint labelPoint = CGPointMake(_handleX + i * _bannerIntervalWidth - preferredSize.width / 2, _handleY + _handleRadius);
        [self.labels[i] drawAtPoint:labelPoint withAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:preferredFontSize], NSFontAttributeName, self.labelsColor, NSForegroundColorAttributeName, nil]];
    }

    // 绘制handleBackGroundRect
    [self.handleBackgroundColor set];
    CGRect handleBackgroundRect = CGRectMake(_handleX - _handleRadius + self.currentIndex * _bannerIntervalWidth, _handleY - _handleRadius, _handleRadius * 2, _handleRadius * 2);
    CGContextFillEllipseInRect(context, handleBackgroundRect);

    // 绘制handleRect
    [self.handleColor set];
    CGRect handleRect = CGRectMake(_handleX - _handleCenterRadius + self.currentIndex * _bannerIntervalWidth, _handleY - _handleCenterRadius, _handleCenterRadius * 2, _handleCenterRadius * 2);
    CGContextFillEllipseInRect(context, handleRect);
    
}

#pragma mark - UIControl overwrites
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super beginTrackingWithTouch:touch withEvent:event];

    CGFloat ptX = [touch locationInView:self].x;
    self.currentIndex = ptX / _bannerIntervalWidth;

    [self sendActionsForControlEvents:UIControlEventValueChanged];
    [self setNeedsDisplay];

    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return [super continueTrackingWithTouch:touch withEvent:event];
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [super endTrackingWithTouch:touch withEvent:event];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [super cancelTrackingWithEvent:event];
}

@end
