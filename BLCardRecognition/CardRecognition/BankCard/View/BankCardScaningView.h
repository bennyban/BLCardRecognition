//
//  BankCardScaningView.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BankCardFlashHandle)(void);

typedef void(^BankCardBackHandle)(void);

@interface BankCardScaningView : UIView

@property (nonatomic,assign) CGRect facePathRect;

@property (nonatomic, strong) UIButton *btnFlash; // 闪光灯

@property (nonatomic, copy  ) BankCardFlashHandle flashHandle; // 闪光灯

@property (nonatomic, copy  ) BankCardBackHandle  backHandle;   // 返回

@end
