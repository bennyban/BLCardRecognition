//
//  RectManager.h
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface RectManager : NSObject

@property (nonatomic, assign)CGRect subRect;

+ (CGRect)getEffectImageRect:(CGSize)size;

+ (CGRect)getGuideFrame:(CGRect)rect;

+ (int)docode:(unsigned char *)pbBuf len:(int)tLen;

+ (CGRect)getCorpCardRect:(int)width  height:(int)height guideRect:(CGRect)guideRect charCount:(int) charCount;

+ (char *)getNumbers;


@end
