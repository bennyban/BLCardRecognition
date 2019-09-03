//
//  IDCardListViewController.m
//  BLCardRecognition
//
//  Created by bennyban on 2019/9/2.
//  Copyright © 2019 BOB. All rights reserved.
//

#import "IDCardListViewController.h"
#import "PortraitCaptureViewController.h"
#import "EmblemCaptureViewController.h"
#import "IDCardInfoViewController.h"
#import "IDResultModel.h"

@interface IDCardListViewController ()

@end

@implementation IDCardListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setDefaultData];
    [self initView];
}

- (void)setDefaultData
{
    self.title = @"身份证识别";
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
    lbTips.text = @"请准备好您的身份证原件";
    [self.view addSubview:lbTips];
    
    UIImage *img = [UIImage imageNamed:@"idcard_first.png"];
    
    orignY += height + 15;
    height = img.size.height*width/img.size.width;
    
    UIImageView *IMGVExample = [[UIImageView alloc] initWithImage:img];
    IMGVExample.frame = CGRectMake(orignX, orignY, width, height);
    [self.view addSubview:IMGVExample];
    
    orignY += height + 80;
    height = 45;
    
    UIButton *btnFront = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnFront setTitle:@"开始识别(正面)" forState:UIControlStateNormal];
    btnFront.frame = CGRectMake(orignX, orignY, width, height);
    [btnFront setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnFront.layer.cornerRadius = 3.0;
    btnFront.layer.masksToBounds = YES;
    btnFront.layer.borderColor = [UIColor redColor].CGColor;
    btnFront.layer.borderWidth = 0.5;
    btnFront.tag = 1000;
    [btnFront addTarget:self action:@selector(doActionToValidateFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnFront];
    
    orignY += height + 30;
    
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setTitle:@"开始识别(反面)" forState:UIControlStateNormal];
    btnBack.frame = CGRectMake(orignX, orignY, width, height);
    [btnBack setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btnBack.layer.cornerRadius = 3.0;
    btnBack.layer.masksToBounds = YES;
    btnBack.layer.borderColor = [UIColor redColor].CGColor;
    btnBack.layer.borderWidth = 0.5;
    btnBack.tag = 1001;
    [btnBack addTarget:self action:@selector(doActionToValidateFunction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnBack];
}

#pragma mark - 事件
#pragma mark -
- (void)doActionToValidateFunction:(UIButton *)sender
{
    __weak typeof(self) weakSelf = self;
    switch (sender.tag) {
        case 1000: // 正面拍摄
            {
                PortraitCaptureViewController *portraitCtrl = [[PortraitCaptureViewController alloc] init];
                portraitCtrl.recognitionHandle = ^(IDResultModel *result) {
                    
                    IDCardInfoViewController *idCardCtrl = [[IDCardInfoViewController alloc] init];
                    idCardCtrl.idInfo = result;
                    [weakSelf.navigationController pushViewController:idCardCtrl animated:YES];
                    
                };
                [self presentViewController:portraitCtrl animated:NO completion:nil];
//                [self.navigationController pushViewController:portraitCtrl animated:YES];
            }
            break;
            
        case 1001: // 反面拍摄
        {
            EmblemCaptureViewController *emblemCtrl = [[EmblemCaptureViewController alloc] init];
            emblemCtrl.recognitionHandle = ^(IDResultModel *result) {
                
                IDCardInfoViewController *idCardCtrl = [[IDCardInfoViewController alloc] init];
                idCardCtrl.idInfo = result;
                [weakSelf.navigationController pushViewController:idCardCtrl animated:YES];
                
            };
            [self presentViewController:emblemCtrl animated:NO completion:nil];
        }
            break;
            
        default:
            break;
    }
}

@end
