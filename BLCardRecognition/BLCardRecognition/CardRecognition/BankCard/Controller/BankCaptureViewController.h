//
//  BankCaptureViewController.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BankReslutModel;

typedef void(^BankCardRecognition)(BankReslutModel *result);

@interface BankCaptureViewController : UIViewController

@property (nonatomic, copy) BankCardRecognition recognitionHandle;

@end
