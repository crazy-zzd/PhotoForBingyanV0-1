//
//  FilterViewController.h
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPUImage.h"
#import "MyDefineHeader.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
//#import "ViewController.h"

#define SLIDER_X 50
#define SLIDER_Y 500
#define SLIDER_LENGTH 220
#define SLIDER_HEIGHT 20

#define SLIDER_VALUE 0.5
#define SLIDER_MIN 0.0
#define SLIDER_MAX 1.0

#define LABELSLIDER_X 0
#define LABELSLIDER_Y 450
#define LABELSLIDER_LENGTH 320
#define LABELSLIDER_HEIGHT 40

#define LABELTITLE_X 0
#define LABELTITLE_Y 50
#define LABELTITLE_LENGTH 320
#define LABELTITLE_HEIGHT 40

#define SAVEBUTTON_X 260
#define SAVEBUTTON_Y 20
#define SAVEBUTTON_LENGTH 60
#define SAVEBUTTON_HEIGHT 40

#define GETBACKBUTTON_X 0
#define GETBACKBUTTON_Y 20
#define GETBACKBUTTON_LENGTH 60
#define GETBACKBUTTON_HEIGTH 40

@interface FilterViewController : UIViewController{
    GPUImagePicture * sourcePicture;
    GPUImageOutput<GPUImageInput> * currentFilter;
//    GPUImageOutput<GPUImageInput> * tiltShiftFilter;

    GPUImageView * primaryView;
    
    UIImage * inputImage;
    
    UISlider * imgSlider;
    UILabel * labelOfSlider;
    UILabel * labelOfTitle;
    
    UIButton * saveButton;
    UIButton * getbackButton;
    
    UIImageView * outputImageView;
    
    int typeOfFilter;
}

@property  int typeOfFilter;
@property (nonatomic,retain) UIImageView * outputImageView;

-(IBAction)updateSliderValue:(id)sender;

-(IBAction)pressSaveButton:(id)sender;

-(IBAction)pressGetbackButton:(id)sender;

-(void)saveImage;

-(void)setInputImage:(UIImage *)theImage;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil inputImage:(UIImage *) theImage;

@end
