# ImageTextButton
### 包含多种样式的自定义按钮，省去设置按钮偏移量的烦恼。


#### 简单介绍
ImageTextButton是继承于UIButton的按钮，包含图片和文字，有多种常见的布局类型，只需要简单地设置属性CRButtonTitleWithImageAlignment即可实现很常用的图文并排的按钮，容易拓展。以后大家就可以不用自定义view、image、title、button来实现这样一个效果了。
利用的方法也是UIButton本身的固有属性UIEdgeInsets，设置图片和文字的相对位置，以达到常用的图文并排的按钮效果。

#### 使用方法
使用很简单，直接查看demo。
    
    self.imgTextButton = [[ImageTextButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 150) / 2, 200, 150, 100)
                                                          image:[UIImage imageNamed:@"buttonImg.png"]
                                                          title:@"点我"];
    self.imgTextButton.imgTextDistance = 6; //可修改图片标题的间距，默认为5
    self.imgTextButton.buttonTitleWithImageAlignment = CRButtonTitleWithImageAlignmentUp; //设置布局样式
    [self.imgTextButton addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.imgTextButton];
		
