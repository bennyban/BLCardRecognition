//
//  BankReslutModel.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface BankReslutModel : NSObject

@property (nonatomic, copy) NSString *bankNumber; // 银行卡号

@property (nonatomic, copy) NSString *bankName;   // 银行卡名称

@property (nonatomic, strong) UIImage *bankImage;  // 图片

@end
