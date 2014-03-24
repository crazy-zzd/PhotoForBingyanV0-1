//
//  ShowViewController.m
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    //just for test
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    appDelegate = [[UIApplication sharedApplication] delegate];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"mainbackground.jpg"]]];
    //初始化按钮
    theSwitchViewsBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    theSwitchViewsBtn.frame = CGRectMake(BUTTON_X, BUTTON_Y, BUTTON_LENGTH, BUTTON_HEIGHT);
    [theSwitchViewsBtn setTitle:BUTTON_TITLE forState:UIControlStateNormal];
    [theSwitchViewsBtn addTarget:self action:@selector(onPressSwitchBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theSwitchViewsBtn];
    //    [self.view insertSubview:theSwitchViewsBtn atIndex:2];
    
    //初始化照片选取按钮
    thePhotoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    thePhotoButton.frame = CGRectMake(BTNPHOTO_X, BTNPHOTO_Y, BTNPHOTO_LENGTH, BTNPHOTO_HEIGTH);
    [thePhotoButton setTitle:BTNPHOTO_TITLE forState:UIControlStateNormal];
    [thePhotoButton addTarget:self action:@selector(onPressPhotoBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:thePhotoButton];
    
    //初始化照相机选取按钮
    theCameraButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    theCameraButton.frame = CGRectMake(BTNCAMERA_X, BTNCAMERA_Y, BTNCAMERA_LENGTH, BTNCAMERA_HEIGTH);
    [theCameraButton setTitle:BTNCAMERA_TITLE forState:UIControlStateNormal];
    [theCameraButton addTarget:self action:@selector(onPressCameraBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:theCameraButton];
    
    
    //初始化图片控件
    
    UIImage * tempImage = [UIImage imageNamed:IMAGE_NAME];

    imageView = [[UIImageView alloc] initWithImage:tempImage];
    imageView.frame = [self fitScreenFrameWithHeight:tempImage.size.height Length:tempImage.size.width];
    [imageView setAlpha:0];
        [self.view addSubview:imageView];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGRect)fitScreenFrameWithHeight:(int)theHeight Length:(int)theLength
{
    CGRect mainScreen = [[UIScreen mainScreen] bounds];
    CGFloat tempScale = theHeight / theLength;
    if (tempScale > 1) {
        CGFloat height = mainScreen.size.height;
        CGFloat width = height / tempScale;
        return CGRectMake(0.5 * (mainScreen.size.width - width), mainScreen.origin.y, width, height);
    }
    else{
        CGFloat width = mainScreen.size.width;
        CGFloat height = width * tempScale;
        return CGRectMake(mainScreen.origin.x, 0.5 * (mainScreen.size.height - height), width, height);
    }
}

- (void)setInputImage:(UIImage *)theImage
{
    inputImage = theImage;
    imageView.image = inputImage;
    imageView.alpha = 1;
    
}

- (IBAction)onPressSwitchBtn:(id)sender
{
    if (inputImage == nil) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示~" message:@"大哥先弄张照片把" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    [appDelegate forwardView];
    }
//    [self transitionFromViewController:theShowVC toViewController:theChooseVC duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL finished){}];
    
}

- (IBAction)onPressPhotoBtn:(id)sender
{
    imagePicker = [[UIImagePickerController alloc]init];
    UIImagePickerControllerSourceType	soureType;
    //soureType当改成UIImagePickerControllerSourceTypeCamera时为照相机照照片模式，UIImagePickerControllerSourceTypePhotoLibrary为相册选取模式
    soureType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate =self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = soureType;
    
    UIDevice *device  = [UIDevice currentDevice];
    NSLog(@"device.model %@",device.model);
    
    [self
     presentViewController:imagePicker animated:YES completion:^(void){
        
    }];
}

- (IBAction)onPressCameraBtn:(id)sender
{
    imagePicker = [[UIImagePickerController alloc]init];
    UIImagePickerControllerSourceType	soureType;
    
    soureType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate =self;
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = soureType;
    
    
    
    
    UIDevice *device  = [UIDevice currentDevice];
    NSLog(@"device.model %@",device.model);
    
    [self presentViewController:imagePicker animated:YES completion:^(void){
        
    }];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    inputImage = [info objectForKey:UIImagePickerControllerEditedImage];
    [picker dismissViewControllerAnimated:YES completion:^(void){
        
    }];
    [appDelegate setInputImage:inputImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

@end
