//
//  ChooseViewController.h
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "FilterViewController.h"
#import "DecideViewController.h"
#import "MyDefineHeader.h"

#define FASTBLURBTN_TITLE @"模糊滤镜"
#define SEPIABTN_TITLE @"怀旧滤镜"
#define SKETCHBTN_TITLE @"素描滤镜"
#define BULGEBTN_TITLE @"气泡滤镜"

#define FASTBLURBTN_X 5
#define FASTBLURBTN_Y 80

#define SEPIABTN_X 165
#define SEPIABTN_Y 80

#define SKETCHBTN_X 5
#define SKETCHBTN_Y 320

#define BULGEBTN_X 165
#define BULGEBTN_Y 320

#define FILTERBUTTON_LENGTH 150
#define FILTERBUTTON_HEIGHT 150

@interface ChooseViewController : UIViewController{
    FilterViewController * theFilterVC;
    DecideViewController * theDecideVC;
    
    UIButton * theFastBlurButton;
    UIButton * theSepiaButton;
    UIButton * theSketchButton;
    UIButton * theBulgeDistortionButton;
    
    UIImage * inputImage;
}

@property (nonatomic,retain) FilterViewController * theFilterVC;
@property (nonatomic,retain) DecideViewController * theDecideVC;

-(UIButton *)allocButtonWithTitle:(NSString *)title Rect:(CGRect)rect;

-(void)changeView;

-(IBAction)pressFastBlurBtn:(id)sender;
-(IBAction)pressSepiaBtn:(id)sender;
-(IBAction)pressSketchBtn:(id)sender;
-(IBAction)pressBulgeDistortionBtn:(id)sender;

-(void)setInputImage:(UIImage *)theImage;

@end
