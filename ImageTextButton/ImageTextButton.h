//
//  ImageTextButton.h
//  X8General
//
//  ImageTextButton继承自UIButton，所以UIButton所有的方法适用于imagetextbutton
//
//  Created by zh_cxr on 17/4/12.
//  Copyright © 2017年 常宣任. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CRButtonTitleWithImageAlignment) {
    CRButtonTitleWithImageAlignmentUp = 0,             //图片在上，标题在下
    CRButtonTitleWithImageAlignmentLeft = 1,           //图片在左，标题在右
    CRButtonTitleWithImageAlignmentDown = 2,           //图片在下，标题在上
    CRButtonTitleWithImageAlignmentRight = 3,          //图片在右，标题在左
    CRButtonTitleWithImageAlignmentRightBothSide = 4,  //
    CRButtonTitleWithImageAlignmentRightSide,          //图片在最右侧
    
};

typedef void(^SelectorAction)(NSInteger tag);


@interface ImageTextButton : UIButton

//初始化
- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)img title:(NSString *)title;


@property (nonatomic) CGFloat imgTextDistance;  //图片和标题的距离，默认为5
@property (nonatomic) CRButtonTitleWithImageAlignment buttonTitleWithImageAlignment;  //用的时候需要设置value

//用于按钮的点击block回调，可自定义点击事件
@property (nonatomic, copy) void(^selectorAction)(NSInteger tag);


- (CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment;
- (void)setButtonTitleWithImageAlignment:(CRButtonTitleWithImageAlignment)buttonTitleWithImageAlignment;


- (void)actionWith:(SelectorAction)selectorAction;

- (void)setTitle:(NSString *)title;


@end
