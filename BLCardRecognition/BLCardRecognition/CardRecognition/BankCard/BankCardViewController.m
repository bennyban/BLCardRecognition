//
//  BankCardViewController.m
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/3.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "BankCardViewController.h"
#import "BankReslutModel.h"

@interface BankCardViewController ()

@property (strong, nonatomic) UIImageView *IMGVBankCard;

@property (strong, nonatomic) UILabel *lbBankNumber;

@property (strong, nonatomic) UILabel *lbBankName;

@end

@implementation BankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultData];
    [self initView];
    
    self.IMGVBankCard.layer.cornerRadius = 8;
    self.IMGVBankCard.layer.masksToBounds = YES;
    
    self.IMGVBankCard.image = _bankInfo.bankImage;
    if (_bankInfo.bankNumber) {
        self.lbBankNumber.text = _bankInfo.bankNumber;
        self.lbBankName.text = [NSString stringWithFormat:@"银行名称: %@",_bankInfo.bankName];
    }
}

- (void)setDefaultData
{
    self.title = @"银行卡信息";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initView
{
    CGFloat orignX = 10;
    CGFloat orignY = 100;
    CGFloat width  = self.view.frame.size.width - 2*orignX;
    CGFloat height = 30;
    
    UILabel *lbTips = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbTips.backgroundColor = [UIColor clearColor];
    lbTips.font = [UIFont systemFontOfSize:15];
    lbTips.textColor = [UIColor grayColor];
    lbTips.textAlignment = NSTextAlignmentCenter;
    lbTips.text = @"您的银行卡";
    [self.view addSubview:lbTips];
    
    UIImage *img = [UIImage imageNamed:@"idcard_first.png"];
    
    orignY += height + 15;
    height = img.size.height*width/img.size.width;
    
    _IMGVBankCard = [[UIImageView alloc] initWithImage:nil];
    _IMGVBankCard.frame = CGRectMake(orignX, orignY, width, height);
    [self.view addSubview:_IMGVBankCard];
    
    orignY += height + 10;
    height = 25;
    
    lbTips = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbTips.backgroundColor = [UIColor clearColor];
    lbTips.font = [UIFont systemFontOfSize:15];
    lbTips.textColor = [UIColor grayColor];
    lbTips.textAlignment = NSTextAlignmentCenter;
    lbTips.text = @"请核对银行卡号码，确认无误";
    [self.view addSubview:lbTips];
    
    orignY += height + 10;
    
    _lbBankNumber = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbBankNumber.backgroundColor = [UIColor clearColor];
    _lbBankNumber.textColor = [UIColor redColor];
    _lbBankNumber.textAlignment = NSTextAlignmentCenter;
    _lbBankNumber.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbBankNumber];
    
    orignY += height + 10;
    
    _lbBankName = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbBankName.backgroundColor = [UIColor clearColor];
    _lbBankName.textColor = [UIColor redColor];
    _lbBankName.textAlignment = NSTextAlignmentLeft;
    _lbBankName.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbBankName];
    
    
    orignX = _IMGVBankCard.frame.origin.x;
    orignY += height + 30;
    width  = (self.view.frame.size.width - 3*orignX)/2;
    height = 40;
    
    UIButton *btnError = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnError setTitle:@"错误，重新拍" forState:UIControlStateNormal];
    btnError.frame = CGRectMake(orignX, orignY, width, height);
    [btnError setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnError.layer.cornerRadius = 3.0;
    btnError.layer.masksToBounds = YES;
    btnError.layer.borderColor = [UIColor redColor].CGColor;
    btnError.layer.borderWidth = 0.5;
    [btnError addTarget:self action:@selector(shootAgain:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnError];
    
    orignX += width + orignX;
    
    UIButton *btnCorrect = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCorrect setTitle:@"正确，下一步" forState:UIControlStateNormal];
    btnCorrect.frame = CGRectMake(orignX, orignY, width, height);
    [btnCorrect setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnCorrect.layer.cornerRadius = 3.0;
    btnCorrect.layer.masksToBounds = YES;
    btnCorrect.layer.borderColor = [UIColor redColor].CGColor;
    btnCorrect.layer.borderWidth = 0.5;
    [btnCorrect addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCorrect];
    
}


#pragma mark - 错误，重新拍摄
- (void)shootAgain:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 正确，下一步
- (void)nextStep:(UIButton *)sender
{
    NSLog(@"经用户核对，身份证号码正确，那就进行下一步，比如身份证图像或号码经加密后，传递给后台");
}

@end
