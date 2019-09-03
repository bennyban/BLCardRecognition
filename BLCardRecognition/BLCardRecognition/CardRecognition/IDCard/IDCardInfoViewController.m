//
//  IDCardInfoViewController.m
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "IDCardInfoViewController.h"
#import "IDResultModel.h"

@interface IDCardInfoViewController ()

@property (strong, nonatomic) UIImageView *IMGVIDCard;

@property (strong, nonatomic) UILabel *lbIDNumber;

@property (strong, nonatomic) UILabel *lbName;

@property (strong, nonatomic) UILabel *lbSex;

@property (strong, nonatomic) UILabel *lbNation;

@property (strong, nonatomic) UILabel *lbAdress;

@property (strong, nonatomic) UILabel *lbVisaAgency;

@property (strong, nonatomic) UILabel *lbTermOfValidity;

@end

@implementation IDCardInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultData];
    [self initView];
    
    self.IMGVIDCard.layer.cornerRadius = 8;
    self.IMGVIDCard.layer.masksToBounds = YES;
    
    if (_idInfo.name) {
        self.IMGVIDCard.image = _idInfo.frontImage;
        self.lbIDNumber.text = _idInfo.num;
        self.lbName.text = [NSString stringWithFormat:@"姓名: %@",_idInfo.name];
        self.lbSex.text = [NSString stringWithFormat:@"性别: %@",_idInfo.gender];
        self.lbNation.text = [NSString stringWithFormat:@"民族: %@",_idInfo.nation];
        self.lbAdress.text = [NSString stringWithFormat:@"地址: %@",_idInfo.address];
    } else {
        self.IMGVIDCard.image = _idInfo.emblemImage;
        self.lbVisaAgency.text = [NSString stringWithFormat:@"签发机关: %@",_idInfo.issue];
        self.lbTermOfValidity.text = [NSString stringWithFormat:@"有效期: %@",_idInfo.valid];
    }
}

- (void)setDefaultData
{
    self.title = @"身份证信息";
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
    lbTips.text = @"您的身份证";
    [self.view addSubview:lbTips];
    
    UIImage *img = [UIImage imageNamed:@"idcard_first.png"];
    
    orignY += height + 15;
    height = img.size.height*width/img.size.width;
    
    _IMGVIDCard = [[UIImageView alloc] initWithImage:nil];
    _IMGVIDCard.frame = CGRectMake(orignX, orignY, width, height);
    [self.view addSubview:_IMGVIDCard];
    
    orignY += height + 10;
    height = 25;
    
    lbTips = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    lbTips.backgroundColor = [UIColor clearColor];
    lbTips.font = [UIFont systemFontOfSize:15];
    lbTips.textColor = [UIColor grayColor];
    lbTips.textAlignment = NSTextAlignmentCenter;
    lbTips.text = @"请核对身份证号码，确认无误";
    [self.view addSubview:lbTips];
    
    orignY += height + 10;
    
    _lbIDNumber = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbIDNumber.backgroundColor = [UIColor clearColor];
    _lbIDNumber.textColor = [UIColor redColor];
    _lbIDNumber.textAlignment = NSTextAlignmentCenter;
    _lbIDNumber.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbIDNumber];
    
    orignY += height + 10;
    
    _lbName = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbName.backgroundColor = [UIColor clearColor];
    _lbName.textColor = [UIColor redColor];
    _lbName.textAlignment = NSTextAlignmentLeft;
    _lbName.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbName];
    
    orignY += height + 10;
    
    _lbSex = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbSex.backgroundColor = [UIColor clearColor];
    _lbSex.textColor = [UIColor redColor];
    _lbSex.textAlignment = NSTextAlignmentLeft;
    _lbSex.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbSex];
    
    orignY += height + 10;
    
    _lbAdress = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbAdress.backgroundColor = [UIColor clearColor];
    _lbAdress.textColor = [UIColor redColor];
    _lbAdress.textAlignment = NSTextAlignmentLeft;
    _lbAdress.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbAdress];
    
    orignY += height + 10;
    
    _lbVisaAgency = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbVisaAgency.backgroundColor = [UIColor clearColor];
    _lbVisaAgency.textColor = [UIColor redColor];
    _lbVisaAgency.textAlignment = NSTextAlignmentLeft;
    _lbVisaAgency.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbVisaAgency];
    
    orignY += height + 10;
    
    _lbTermOfValidity = [[UILabel alloc] initWithFrame:CGRectMake(orignX, orignY, width, height)];
    _lbTermOfValidity.backgroundColor = [UIColor clearColor];
    _lbTermOfValidity.textColor = [UIColor redColor];
    _lbTermOfValidity.textAlignment = NSTextAlignmentLeft;
    _lbTermOfValidity.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:_lbTermOfValidity];
    
    orignX = _IMGVIDCard.frame.origin.x;
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
