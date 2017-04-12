//
//  ImageTextButton.m
//  X8General
//
//  Created by zh_cxr on 17/4/12.
//  Copyright © 2017年 常宣任. All rights reserved.
//

#import "ImageTextButton.h"

@implementation ImageTextButton

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString *)title {
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:img forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        
        //为了便于布局，设置默认的对齐方式
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
        
        
        self.imgTextDistance = 5;
    }
    return self;
}

- (void)setButtonTitleWithImageAlignment:(CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment {
    _buttonTitleWithImageAlignment = buttonTitleWithImageAlignment;
    [self alignmentValueChanged];
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
    [self alignmentValueChanged];
}

- (void)alignmentValueChanged {
    CGFloat buttonWidth = self.frame.size.width;
    CGFloat buttonHeight = self.frame.size.height;
    CGFloat imgWidth = self.imageView.image.size.width;
    CGFloat imgHeight = self.imageView.image.size.height;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat textWitdh = textSize.width;
    CGFloat textHeight = textSize.height;
    
    CGFloat interval;      //图片标题整体和按钮边缘的间距
    CGFloat imgOffsetX;    //image水平偏移量
    CGFloat imgOffsetY;    //image垂直偏移量
    CGFloat titleOffsetX;  //title水平偏移量
    CGFloat titleOffsetY;  //title垂直偏移量
    
    if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentUp) {
        interval = (buttonHeight-(imgHeight+_imgTextDistance+textHeight))/2;
        imgOffsetX = (buttonWidth-imgWidth)/2;
        imgOffsetY = interval;
        titleOffsetX = (buttonWidth-textWitdh)/2-imgWidth;
        titleOffsetY = interval+imgHeight+_imgTextDistance;
    }
    else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentLeft) {
        interval = (buttonWidth-(imgWidth+_imgTextDistance+textWitdh))/2;
        imgOffsetX = interval;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = buttonWidth-(imgWidth+textWitdh+interval);
        titleOffsetY = (buttonHeight-textHeight)/2;
    }
    else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentDown) {
        interval = (buttonHeight-(imgHeight+_imgTextDistance+textHeight))/2;
        imgOffsetX = (buttonWidth-imgWidth)/2;
        imgOffsetY = interval+textHeight+_imgTextDistance;
        titleOffsetX = (buttonWidth-textWitdh)/2-imgWidth;
        titleOffsetY = interval;
    }
    else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentRight) {
        interval = (buttonWidth-(imgWidth+_imgTextDistance+textWitdh))/2;
        imgOffsetX = interval+textWitdh+_imgTextDistance;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = -(imgWidth-interval);
        titleOffsetY = (buttonHeight-textHeight)/2;
    }
    else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentRightBothSide) {
        imgOffsetX = buttonWidth-imgWidth;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = -imgWidth;
        titleOffsetY = (buttonHeight-textHeight)/2;
    }
    else if (_buttonTitleWithImageAlignment == CRButtonTitleWithImageAlignmentRightSide) {
        interval = (buttonHeight-(imgHeight+_imgTextDistance+textHeight))/2;
        imgOffsetX = buttonWidth-imgWidth-20;
        imgOffsetY = (buttonHeight-imgHeight)/2;
        titleOffsetX = (buttonWidth-textWitdh)/2-imgWidth;
        titleOffsetY = (buttonHeight-textHeight)/2;
    }
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(imgOffsetY, imgOffsetX, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleOffsetY, titleOffsetX, 0, 0)];
}

- (void)click:(UIButton *)sender {
    self.selectorAction(sender.tag);
}

- (void)actionWith:(SelectorAction)selectorAction {
    self.selectorAction = selectorAction;
}

@end
