//
//  EmblemCaptureViewController.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IDResultModel;

typedef void(^IDCardEmblemRecognition)(IDResultModel *result);

@interface EmblemCaptureViewController : UIViewController

@property (nonatomic, copy) IDCardEmblemRecognition recognitionHandle;

@end
