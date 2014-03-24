//
//  ShowViewController.h
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDefineHeader.h"
#import "AppDelegate.h"

#define BUTTON_TITLE @"滤镜效果"
#define BTNPHOTO_TITLE @"照片选取"
#define BTNCAMERA_TITLE @"拍照选取"

#define BUTTON_X 240
#define BUTTON_Y 40
#define BUTTON_LENGTH 70
#define BUTTON_HEIGHT 40

#define BTNCAMERA_X 0
#define BTNCAMERA_Y 40
#define BTNCAMERA_LENGTH 70
#define BTNCAMERA_HEIGTH 40

#define BTNPHOTO_X 80
#define BTNPHOTO_Y 40
#define BTNPHOTO_LENGTH 70
#define BTNPHOTO_HEIGTH 40



@interface ShowViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    UIImage * inputImage;
    
    UIImageView * imageView;
    
    UIButton * theSwitchViewsBtn;
        
    UIButton * thePhotoButton;
    UIButton * theCameraButton;
    
    UIImagePickerController * imagePicker;

    
    AppDelegate * appDelegate;
}


-(CGRect)fitScreenFrameWithHeight:(int)theHeight Length:(int)theLength;

-(void)setInputImage:(UIImage *)theImage;

-(IBAction)onPressSwitchBtn:(id)sender;

-(IBAction)onPressPhotoBtn:(id)sender;
-(IBAction)onPressCameraBtn:(id)sender;

//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info;
//-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;

@end
