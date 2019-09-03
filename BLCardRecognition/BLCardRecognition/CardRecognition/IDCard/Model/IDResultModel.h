//
//  IDResultModel.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface IDResultModel : NSObject

@property (nonatomic,assign) int type; //1:正面  2:反面

@property (nonatomic,copy) NSString *num; //身份证号

@property (nonatomic,copy) NSString *name; //姓名

@property (nonatomic,copy) NSString *gender; //性别

@property (nonatomic,copy) NSString *nation; //民族

@property (nonatomic,copy) NSString *address; //地址

@property (nonatomic,copy) NSString *issue; //签发机关

@property (nonatomic,copy) NSString *valid; //有效期

@property (nonatomic,strong) UIImage *frontImage; // 正面照

@property (nonatomic,copy) UIImage *emblemImage;  // 国徽照

@end
