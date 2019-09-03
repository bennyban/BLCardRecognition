//
//  RootViewController.m
//  OCR-Demo
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "RootViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "IDCardListViewController.h"
#import "BankCaptureViewController.h"
#import "BankCardViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultData];
    [self initView];
}

- (void)setDefaultData
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"身份证和银行卡识别";
}

- (void)initView
{
    CGFloat orignX = 50;
    CGFloat orignY = 150;
    CGFloat width  = self.view.frame.size.width - 2*orignX;
    CGFloat height = 40;
    
    UIButton *btnOnline = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOnline setTitle:@"身份证识别" forState:UIControlStateNormal];
    btnOnline.frame = CGRectMake(orignX, orignY, width, height);
    [btnOnline setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnOnline.layer.cornerRadius = 3.0;
    btnOnline.layer.masksToBounds = YES;
    btnOnline.layer.borderColor = [UIColor redColor].CGColor;
    btnOnline.layer.borderWidth = 0.5;
    btnOnline.tag = 1000;
    [btnOnline addTarget:self action:@selector(doActionToValidateFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOnline];
    
    orignY += height + 30;
    
    btnOnline = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOnline setTitle:@"银行卡识别" forState:UIControlStateNormal];
    btnOnline.frame = CGRectMake(orignX, orignY, width, height);
    [btnOnline setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnOnline.layer.cornerRadius = 3.0;
    btnOnline.layer.masksToBounds = YES;
    btnOnline.layer.borderColor = [UIColor redColor].CGColor;
    btnOnline.layer.borderWidth = 0.5;
    btnOnline.tag = 1001;
    [btnOnline addTarget:self action:@selector(doActionToValidateFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnOnline];
}

- (void)doActionToValidateFunction:(UIButton *)sender
{
    switch (sender.tag) {
        case 1000:
            {
                IDCardListViewController *idCardCtrl = [[IDCardListViewController alloc] init];
                [self.navigationController pushViewController:idCardCtrl animated:YES];
            }
            break;
            
        case 1001:
        {
            __weak typeof(self) weakSelf = self;
            BankCaptureViewController *idCardCtrl = [[BankCaptureViewController alloc] init];
            idCardCtrl.recognitionHandle = ^(BankReslutModel *result) {
                BankCardViewController *bankCardCtrl = [[BankCardViewController alloc] init];
                bankCardCtrl.bankInfo = result;
                [weakSelf.navigationController pushViewController:bankCardCtrl animated:YES];
            };
            [self presentViewController:idCardCtrl animated:NO completion:nil];
        }
            break;
            
        default:
            break;
    }
}


@end
