//
//  BankReslutModel.m
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "BankReslutModel.h"

@implementation BankReslutModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.bankNumber = @"";
        self.bankName = @"";
    }
    return self;
}

@end
