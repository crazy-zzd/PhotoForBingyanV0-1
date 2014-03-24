//
//  ViewController.h
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowViewController.h"
#import "FilterViewController.h"
#import "ChooseViewController.h"


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



@interface ViewController : UIViewController{
    ShowViewController * theShowVC;
    ChooseViewController * theChooseVC;

    
    UIImage * theInputImage;
    
}

@property (nonatomic,retain) ShowViewController * theShowVC;
@property (nonatomic,retain) ChooseViewController * theChooseVC;



-(void)getbackView;

-(void)getforwardView;

-(void)setInputImage:(UIImage *)theImage;

@end
