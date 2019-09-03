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

# 运行报错

错误一、 ENABLE_BITCODE 错误

解决方法：在**TARGETS**和**PROJECT** 两处，中的 **Buid Setting** 下找到 **Enable Bitcode** 将其设置为**NO**； **Xcode8** 环境下会检测.a 文件， 所以将 **Enable Testability** 设置为 **NO**。

错误二、
```
Undefined symbols for architecture arm64:
  "_ZIM_SaveImage", referenced from:
      ImgSave(tagIMG, char const*) in libbankcard.a(gjimage.o)
  "_ZIM_LoadImage", referenced from:
      ImgLoad(tagIMG&, char const*) in libbankcard.a(gjimage.o)
  "_ZIM_DoneImage", referenced from:
      ImgLoad(tagIMG&, char const*) in libbankcard.a(gjimage.o)
ld: symbol(s) not found for architecture arm64
clang: error: linker command failed with exit code 1 (use -v to see invocation
```
解决办法：在**TARGETS**和**PROJECT** 两处中**build settings** 搜索 **ENABLE_TESTABILITY** 改为**NO**

注意！如果你是RN项目，**Dead Code Stripping**  设置为**yes**

错误三、 duplicate symbols for architecture arm64（.o文件重复导入了）

解决办法 : 把**idcardios.a**从 **Link Binary With Libraries (3 items)**里面删了就好了。

注意：只删除**idcardios.a**，其他不要删。
