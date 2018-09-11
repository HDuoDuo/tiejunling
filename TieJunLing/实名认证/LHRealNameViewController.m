//
//  LHRealNameViewController.m
//  TieJunLing
//
//  Created by macbook on 2018/9/11.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import "LHRealNameViewController.h"
#import <AliyunOSSiOS/OSSService.h>
@interface LHRealNameViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *frontImgView;
@property (weak, nonatomic) IBOutlet UIImageView *backImgView;
@property (weak, nonatomic) IBOutlet UIImageView *handleImgView;
@property(nonatomic,strong)UIImageView *currentImgView;
@end

@implementation LHRealNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
    [self createNavLeftItem:@"backBtn" rightItem:nil];
    self.title = @"实名认证";
}
- (void)leftItemTap:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:true];
}
//获取相机拍照
- (void)takePhotos {
    // 创建UIImagePickerController实例
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    // 设置代理
    imagePickerController.delegate = self;
    // 是否允许编辑（默认为NO）
    imagePickerController.allowsEditing = YES;
    // 创建一个警告控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    // 设置警告响应事件
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            // 设置照片来源为相机
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            // 设置进入相机时使用前置或后置摄像头
            imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            // 展示选取照片控制器
            [self presentViewController:imagePickerController animated:YES completion:^{}];
        }
    }];
    UIAlertAction *photosAction = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 判断是否支持相册
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
        {
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePickerController animated:YES completion:^{}];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    // 添加警告按钮
    [alert addAction:cameraAction];
    [alert addAction:photosAction];
    [alert addAction:cancelAction];
    // 展示警告控制器
    [self presentViewController:alert animated:YES completion:nil];
    
}
#pragma
// 完成图片的选取后调用的方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // 选取完图片后跳转回原控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    /* 此处参数 info 是一个字典，下面是字典中的键值 （从相机获取的图片和相册获取的图片时，两者的info值不尽相同）
     * UIImagePickerControllerMediaType; // 媒体类型
     * UIImagePickerControllerOriginalImage; // 原始图片
     * UIImagePickerControllerEditedImage; // 裁剪后图片
     * UIImagePickerControllerCropRect; // 图片裁剪区域（CGRect）
     * UIImagePickerControllerMediaURL; // 媒体的URL
     * UIImagePickerControllerReferenceURL // 原件的URL
     * UIImagePickerControllerMediaMetadata // 当数据来源是相机时，此值才有效
     */
    // 从info中将图片取出，并加载到imageView当中
    self.currentImgView.image= [info objectForKey:UIImagePickerControllerEditedImage];
    
}
#pragma UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}
- (IBAction)NameTF:(UITextField *)sender {
    
}
- (IBAction)IDCardTF:(UITextField *)sender {
}
- (IBAction)frontPhoto:(UIButton *)sender {
    self.currentImgView = self.frontImgView;
    [self takePhotos];
    
}
- (IBAction)backPhoto:(UIButton *)sender {
    
}
- (IBAction)handlePhoto:(UIButton *)sender {
    
}
- (IBAction)submitBtnTap:(UIButton *)sender {
    //上传图片
    
    NSString *endpoint = @"http://oss-cn-beijing.aliyuncs.com";
    // 移动端建议使用STS方式初始化OSSClient。可以通过sample中STS使用说明了解更多(https://github.com/aliyun/aliyun-oss-ios-sdk/tree/master/DemoByOC)
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc]initWithPlainTextAccessKey:@"LTAIAKrXVMhdviNl" secretKey:@"sX5TBlTkHaZ5uvrMvdHSGE7UftqrPf"];
    OSSClient *client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    put.bucketName = @"tjl-test";
    put.objectKey = @"haha.jpg";
    put.uploadingData = UIImageJPEGRepresentation(self.currentImgView.image, 0.3); // 直接上传NSData
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
    };
    OSSTask * putTask = [client putObject:put];
    [putTask waitUntilFinished];
    if (!putTask.error) {
        NSLog(@"upload object success!");
    }
//    [putTask continueWithBlock:^id(OSSTask *task) {
//        if (!task.error) {
//            NSLog(@"upload object success!");
//        } else {
//            NSLog(@"upload object failed, error: %@" , task.error);
//        }
//        return nil;
//    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
