//
//  IDCoverScaningView.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>

/*********************************************************
 
 Class
 IDFrontScaningView
 
 @abstract
 用于身份证正面提示绘制，页面是使用作者xiaohange的 JQIDCardScaningView 视图，感谢xiaohange分享
 地址：https://github.com/xiaohange/IDCardRecognition
 
 *********************************************************/

typedef void(^IDCoverFlashHandle)(void);

typedef void(^IDCoverBackHandle)(void);

@interface IDCoverScaningView : UIView

@property (nonatomic,assign) CGRect facePathRect;

@property (nonatomic, strong) UIButton *btnFlash; // 闪光灯

@property (nonatomic, copy  ) IDCoverFlashHandle flashHandle; // 闪光灯

@property (nonatomic, copy  ) IDCoverBackHandle  backHandle;   // 返回

@end
