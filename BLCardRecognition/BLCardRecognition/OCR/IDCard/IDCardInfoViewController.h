//
//  IDCardInfoViewController.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IDResultModel;

@interface IDCardInfoViewController : UIViewController

// 身份证信息
@property (nonatomic,strong) IDResultModel *idInfo;

@end
