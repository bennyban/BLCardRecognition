# BLCardRecognition
基于AVFoundation处理，身份证正反面和银行卡识别

效果图展示

* 身份证扫描

<img src="https://github.com/bennyban/BLCardRecognition/blob/master/效果图/身份证.jpeg" width = "400" alt="示例" />

* 身份证正面扫描

<img src="https://github.com/bennyban/BLCardRecognition/blob/master/效果图/身份证正面.jpeg" width = "400" alt="示例" />

* 身份证反面扫描

<img src="https://github.com/bennyban/BLCardRecognition/blob/master/效果图/身份证反面.jpeg" width = "400" alt="示例" />

* 银行卡正面扫描

<img src="https://github.com/bennyban/BLCardRecognition/blob/master/效果图/银行卡正面.jpeg" width = "400" alt="示例" />


身份证识别正面

```
PortraitCaptureViewController *portraitCtrl = [[PortraitCaptureViewController alloc] init];
portraitCtrl.recognitionHandle = ^(IDResultModel *result) {

    IDCardInfoViewController *idCardCtrl = [[IDCardInfoViewController alloc] init];
    idCardCtrl.idInfo = result;
    [weakSelf.navigationController pushViewController:idCardCtrl animated:YES];

};
[self presentViewController:portraitCtrl animated:NO completion:nil];
```

身份证识别反面

```
EmblemCaptureViewController *emblemCtrl = [[EmblemCaptureViewController alloc] init];
emblemCtrl.recognitionHandle = ^(IDResultModel *result) {
    IDCardInfoViewController *idCardCtrl = [[IDCardInfoViewController alloc] init];
    idCardCtrl.idInfo = result;
    [weakSelf.navigationController pushViewController:idCardCtrl animated:YES];
};
[self presentViewController:emblemCtrl animated:NO completion:nil];
```

银行卡识别代码

```
__weak typeof(self) weakSelf = self;
BankCaptureViewController *idCardCtrl = [[BankCaptureViewController alloc] init];
idCardCtrl.recognitionHandle = ^(BankReslutModel *result) {
    BankCardViewController *bankCardCtrl = [[BankCardViewController alloc] init];
    bankCardCtrl.bankInfo = result;
    [weakSelf.navigationController pushViewController:bankCardCtrl animated:YES];
};
[self presentViewController:idCardCtrl animated:NO completion:nil];
```
