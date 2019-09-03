//
//  BankCardScaningView.m
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "BankCardScaningView.h"

// iPhone5/5c/5s/SE 4英寸 屏幕宽高：320*568点 屏幕模式：2x 分辨率：1136*640像素
#define iPhone5or5cor5sorSE ([UIScreen mainScreen].bounds.size.height == 568.0)

// iPhone6/6s/7 4.7英寸 屏幕宽高：375*667点 屏幕模式：2x 分辨率：1334*750像素
#define iPhone6or6sor7 ([UIScreen mainScreen].bounds.size.height == 667.0)

// iPhone6 Plus/6s Plus/7 Plus 5.5英寸 屏幕宽高：414*736点 屏幕模式：3x 分辨率：1920*1080像素
#define iPhone6Plusor6sPlusor7Plus ([UIScreen mainScreen].bounds.size.height == 736.0)

@interface BankCardScaningView ()

@property (nonatomic, strong) CAShapeLayer *IDCardScanningWindowLayer;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIButton *btnLeft;

@property (nonatomic, strong) UILabel  *lbTitle;

@end

@implementation BankCardScaningView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
        // 添加扫描窗口
        [self addScaningWindow];
        
        // 添加导航
        [self addNavBar];
        
        // 添加定时器
        [self addTimer];
    }
    return self;
}

#pragma mark - 添加返回、闪光灯、标题
- (void)addNavBar
{
    //导航标题
    CGFloat orignX = 20;
    CGFloat orignY = 25;
    CGFloat width  = self.frame.size.width - 40;
    CGFloat height = 34;
    
    _lbTitle = [[UILabel alloc]initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbTitle.textColor = [UIColor whiteColor];
    _lbTitle.font = [UIFont systemFontOfSize:18.0];
    _lbTitle.textAlignment = NSTextAlignmentCenter;
    _lbTitle.transform = CGAffineTransformMakeRotation(M_PI/2);
    _lbTitle.backgroundColor = [UIColor clearColor];
    _lbTitle.text = @"扫描银行卡正面";
    [self addSubview:_lbTitle];
    
    CGPoint center = self.center;
    center.x = CGRectGetMaxX(_IDCardScanningWindowLayer.frame) + 35;
    _lbTitle.center = center;
    
    orignX = self.frame.size.width - 49;
    orignY = 25;
    width  = 44;
    height = 44;
    
    //返回
    _btnLeft = [UIButton buttonWithType:UIButtonTypeSystem];
    [_btnLeft setBackgroundImage:[UIImage imageNamed:@"nav_ocr_back.png"] forState:UIControlStateNormal];
    _btnLeft.frame = CGRectMake(orignX, orignY, width, height);//
    _btnLeft.backgroundColor = [UIColor clearColor];
    [_btnLeft addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_btnLeft];
    
    orignX = self.frame.size.width - 52;
    orignY = self.frame.size.height - 54;
    width  = 44;
    height = 44;
    
    //闪光灯
    _btnFlash = [[UIButton alloc]init];
    _btnFlash.frame = CGRectMake(orignX, orignY, width, height);
    [_btnFlash setImage:[UIImage imageNamed:@"nav_torch_off"] forState:UIControlStateNormal];
    [_btnFlash setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    [_btnFlash addTarget:self action:@selector(flash) forControlEvents:UIControlEventTouchUpInside];
    _btnFlash.backgroundColor = [UIColor clearColor];
    [self addSubview:_btnFlash];
}

- (void)back
{
    if (_backHandle) {
        _backHandle ();
    }
}

- (void)flash
{
    if (_flashHandle) {
        _flashHandle ();
    }
}

#pragma mark - 添加扫描窗口
- (void)addScaningWindow
{
    // 中间包裹线
    _IDCardScanningWindowLayer = [CAShapeLayer layer];
    _IDCardScanningWindowLayer.position = self.layer.position;
    CGFloat width = iPhone5or5cor5sorSE? 240: (iPhone6or6sor7? 265: 290);
    _IDCardScanningWindowLayer.bounds = (CGRect){CGPointZero, {width, width * 1.574}};
    _IDCardScanningWindowLayer.cornerRadius = 15;
    _IDCardScanningWindowLayer.borderColor = [UIColor whiteColor].CGColor;
    _IDCardScanningWindowLayer.borderWidth = 1.5;
    [self.layer addSublayer:_IDCardScanningWindowLayer];
    
    // 最里层镂空
    UIBezierPath *transparentRoundedRectPath = [UIBezierPath bezierPathWithRoundedRect:_IDCardScanningWindowLayer.frame cornerRadius:_IDCardScanningWindowLayer.cornerRadius];
    
    // 最外层背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.frame];
    [path appendPath:transparentRoundedRectPath];
    [path setUsesEvenOddFillRule:YES];
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.6;
    
    [self.layer addSublayer:fillLayer];
    
    // 提示标签
    CGPoint center = self.center;
    center.x = CGRectGetMinX(_IDCardScanningWindowLayer.frame) - 25;
    [self addTipLabelWithText:@"将银行卡正面置于此区域内扫描" center:center];
}

#pragma mark - 添加提示标签
- (void )addTipLabelWithText:(NSString *)text center:(CGPoint)center
{
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, 30)];
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    
    tipLabel.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
//    [tipLabel sizeToFit];
    
    tipLabel.center = center;
    
    NSMutableAttributedString *tip = [[NSMutableAttributedString alloc] initWithString:text];
    [tip addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, tip.length)];
    NSRange range=[[tip string]rangeOfString:@"银行卡正面"];
    [tip addAttribute:NSForegroundColorAttributeName value:[self hexStringToColor:@"#2582E9"] range:range];
    tipLabel.attributedText = tip;
    tipLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:tipLabel];
}

#pragma mark - 添加定时器
- (void)addTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    [_timer fire];
}

- (void)timerFire:(id)notice
{
    [self setNeedsDisplay];
}

- (void)dealloc
{
    [_timer invalidate];
}

- (void)drawRect:(CGRect)rect
{
    rect = _IDCardScanningWindowLayer.frame;
    // 人像提示框
    UIBezierPath *facePath = [UIBezierPath bezierPathWithRect:_facePathRect];
    facePath.lineWidth = 1.5;
    [[UIColor whiteColor] set];
    [facePath stroke];
    
    // 水平扫描线
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    static CGFloat moveX = 0;
    static CGFloat distanceX = 0;
    
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, 2);
    CGContextSetRGBStrokeColor(context,0.3,0.8,0.3,0.8);
    CGPoint p1, p2;// p1, p2 连成水平扫描线;
    
    moveX += distanceX;
    if (moveX >= CGRectGetWidth(rect) - 2) {
        distanceX = -2;
    } else if (moveX <= 2){
        distanceX = 2;
    }
    
    p1 = CGPointMake(CGRectGetMaxX(rect) - moveX, rect.origin.y);
    p2 = CGPointMake(CGRectGetMaxX(rect) - moveX, rect.origin.y + rect.size.height);
    
    CGContextMoveToPoint(context,p1.x, p1.y);
    CGContextAddLineToPoint(context, p2.x, p2.y);
    
    CGContextStrokePath(context);
}

- (UIColor *)hexStringToColor:(NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

@end
