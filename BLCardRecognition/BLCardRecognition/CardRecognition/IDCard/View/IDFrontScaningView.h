//
//  IDFrontScaningView.h
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
 用于身份证正面提示绘制，页面是使用作者xiaohange的LHSIDCardScaningView 视图，感谢xiaohange分享
 地址：https://github.com/xiaohange/IDCardRecognition
 
 *********************************************************/

typedef void(^IDFrontFlashHandle)(void);

typedef void(^IDFrontBackHandle)(void);

@interface IDFrontScaningView : UIView

@property (nonatomic,assign) CGRect facePathRect;

@property (nonatomic, strong) UIButton *btnFlash; // 闪光灯

@property (nonatomic, copy  ) IDFrontFlashHandle flashHandle; // 闪光灯

@property (nonatomic, copy  ) IDFrontBackHandle  backHandle;   // 返回

@end
