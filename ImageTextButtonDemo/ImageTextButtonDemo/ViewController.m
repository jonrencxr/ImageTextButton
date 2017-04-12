//
//  ViewController.m
//  ImageTextButtonDemo
//
//  Created by Jonren on 15/12/30.
//  Copyright © 2015年 Jonren. All rights reserved.
//

#import "ViewController.h"
#import "ImageTextButton.h"

@interface ViewController ()

@property (nonatomic, strong) ImageTextButton *imgTextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    /*
     / 调用的时候只需要如下代码即可实现
     / ImageTextButton继承于UIButton，所以UIButton的所有方法可以同样适用
     / imgTextButton点击事件测试即可秒懂
     */
    
    self.imgTextButton = [[ImageTextButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150) / 2, 200, 150, 100)
                                                          image:[UIImage imageNamed:@"buttonImg.png"]
                                                          title:@"点我"];
    self.imgTextButton.imgTextDistance = 6; //可修改图片标题的间距，默认为5
    self.imgTextButton.buttonTitleWithImageAlignment = CRButtonTitleWithImageAlignmentUp; //设置布局样式
    [self.imgTextButton addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imgTextButton];
}

- (void)changeValue:(UIButton *)sender {
    [self.imgTextButton setImage:[UIImage imageNamed:@"buttonImg_1.png"] forState:UIControlStateNormal];
    [self.imgTextButton setTitle:@"请继续点击" forState:UIControlStateNormal];

    switch (self.imgTextButton.buttonTitleWithImageAlignment) {
        case CRButtonTitleWithImageAlignmentUp: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentLeft];
        }
            break;
        case CRButtonTitleWithImageAlignmentLeft: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentDown];
        }
            break;
        case CRButtonTitleWithImageAlignmentDown: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentRight];
        }
            break;
        case CRButtonTitleWithImageAlignmentRight: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentRightBothSide];
        }
            break;
        case CRButtonTitleWithImageAlignmentRightBothSide: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentUpBothLeft];
        }
            break;
        case CRButtonTitleWithImageAlignmentUpBothLeft: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentUpBothRight];
        }
            break;
        case CRButtonTitleWithImageAlignmentUpBothRight: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentDownBothLeft];
        }
            break;
        case CRButtonTitleWithImageAlignmentDownBothLeft: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentDownBothRight];
        }
            break;
        case CRButtonTitleWithImageAlignmentDownBothRight: {
            [self.imgTextButton setButtonTitleWithImageAlignment:CRButtonTitleWithImageAlignmentUp];
        }
            break;
            
        default:
            break;
    }
}

@end
