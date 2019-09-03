//
//  BankCardViewController.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BankReslutModel;

@interface BankCardViewController : UIViewController

// 身份证信息
@property (nonatomic,strong) BankReslutModel *bankInfo;

@end
