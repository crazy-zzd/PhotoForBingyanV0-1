//
//  FilterViewController.m
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@end

@implementation FilterViewController

@synthesize typeOfFilter;
@synthesize outputImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil inputImage:(UIImage *)theImage
{
    inputImage = theImage;
    return [self initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpeg"]]];


        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect mainScreenFrame = CGRectMake(0, 0, 320, 560);
    primaryView = [[GPUImageView alloc] initWithFrame:mainScreenFrame];
    //        self.view = primaryView;
    [self.view addSubview:primaryView];

    [primaryView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpeg"]]];

    //初始化GPUImagePicture
    UIImage * tempImage = [UIImage imageNamed:@"sample1.jpg"];
    if (inputImage != nil) {
        sourcePicture = [[GPUImagePicture alloc] initWithImage:inputImage smoothlyScaleOutput:YES];
    }
    else{
        sourcePicture = [[GPUImagePicture alloc] initWithImage:tempImage smoothlyScaleOutput:YES];
    }
    //初始化标签
    labelOfSlider = [[UILabel alloc] initWithFrame:CGRectMake(LABELSLIDER_X, LABELSLIDER_Y, LABELSLIDER_LENGTH, LABELSLIDER_HEIGHT)];
    [labelOfSlider setBackgroundColor:[UIColor clearColor]];
    [labelOfSlider setTextAlignment:NSTextAlignmentCenter];
    [labelOfSlider setTextColor:[UIColor whiteColor]];
    [labelOfSlider setFont:[UIFont fontWithName:@"Helvetica" size:22]];
    [self.view addSubview:labelOfSlider];
    
    labelOfTitle = [[UILabel alloc] initWithFrame:CGRectMake(LABELTITLE_X, LABELTITLE_Y, LABELTITLE_LENGTH, LABELTITLE_HEIGHT)];
    [labelOfTitle setBackgroundColor:[UIColor clearColor]];
    [labelOfTitle setTextAlignment:NSTextAlignmentCenter];
    [labelOfTitle setTextColor:[UIColor whiteColor]];
    [labelOfTitle setFont:[UIFont fontWithName:@"Helvetica" size:32]];
//    labelOfTitle.text = @"这个是啥";
    [self.view addSubview:labelOfTitle];
    
    //初始化滤镜
    switch (typeOfFilter) {
            //模糊效果
        case TypeFastBlur:
            currentFilter = [[GPUImageFastBlurFilter alloc] init];
            labelOfSlider.text = @"设置模糊度";
            labelOfTitle.text = @"模糊滤镜";
            break;
            //怀旧的褐色
        case TypeSepia:
            currentFilter = [[GPUImageSepiaFilter alloc] init];
            labelOfSlider.text = @"设置褐色浓度";
            labelOfTitle.text = @"怀旧滤镜";
            break;
            //素描
        case TypeSketch:
            currentFilter = [[GPUImageSketchFilter alloc] init];
            labelOfSlider.text = @"设置笔迹粗细";
            labelOfTitle.text = @"素描滤镜";
            break;
            //突起
        case TypeBulgeDistortion:
            currentFilter = [[GPUImageBulgeDistortionFilter alloc] init];
            labelOfSlider.text = @"设置气泡大小";
            labelOfTitle.text = @"气泡滤镜";
            break;
        default:
            break;
    }
    
    //初始化保存按钮
    saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    saveButton.frame = CGRectMake(SAVEBUTTON_X, SAVEBUTTON_Y, SAVEBUTTON_LENGTH, SAVEBUTTON_HEIGHT);
    [saveButton addTarget:self action:@selector(pressSaveButton:) forControlEvents:UIControlEventTouchUpInside];
    [saveButton setTitle:@"保存" forState:UIControlStateNormal];
    
    [self.view addSubview:saveButton];
    
    //初始化返回按钮
    getbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    getbackButton.frame = CGRectMake(GETBACKBUTTON_X, GETBACKBUTTON_Y, GETBACKBUTTON_LENGTH, GETBACKBUTTON_HEIGTH);
    [getbackButton addTarget:self action:@selector(pressGetbackButton:) forControlEvents:UIControlEventTouchUpInside];
    [getbackButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.view addSubview:getbackButton];
    
    
    //初始化Slider
    CGRect sliderRect = CGRectMake(SLIDER_X, SLIDER_Y, SLIDER_LENGTH, SLIDER_HEIGHT);
    
    imgSlider = [[UISlider alloc] initWithFrame:sliderRect];
    [imgSlider addTarget:self action:@selector(updateSliderValue:) forControlEvents:UIControlEventValueChanged];
    imgSlider.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    imgSlider.maximumValue = SLIDER_MAX;
    imgSlider.minimumValue = SLIDER_MIN;
    imgSlider.value = SLIDER_VALUE;
    
    [primaryView addSubview:imgSlider];
    
    //显示图片
    [sourcePicture addTarget:currentFilter];
    [currentFilter addTarget:primaryView];
    [sourcePicture processImage];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateSliderValue:(id)sender
{
    CGFloat midpoint = [(UISlider *)sender value];
    switch (typeOfFilter) {
            //模糊效果
        case TypeFastBlur:
            [(GPUImageFastBlurFilter *)currentFilter setBlurSize:midpoint * 2];
            break;
            //怀旧的褐色
        case TypeSepia:
            [(GPUImageSepiaFilter *)currentFilter setIntensity:midpoint];
            break;
            //素描
        case TypeSketch:
            [(GPUImageSketchFilter *)currentFilter setEdgeStrength:midpoint];
            break;
            //突起
        case TypeBulgeDistortion:
            [(GPUImageBulgeDistortionFilter *)currentFilter setRadius:midpoint];
            break;
        default:
            break;
    }
    
    

    [sourcePicture processImage];
}

- (void)saveImage
{
    UIImage * outputImage;
    switch (typeOfFilter) {
            //模糊效果
        case TypeFastBlur:
            outputImage = [(GPUImageFastBlurFilter *)currentFilter imageFromCurrentlyProcessedOutput];
            break;
            //怀旧的褐色
        case TypeSepia:
            outputImage = [(GPUImageSepiaFilter *)currentFilter imageFromCurrentlyProcessedOutput];
            break;
            //素描
        case TypeSketch:
            outputImage = [(GPUImageSketchFilter *)currentFilter imageFromCurrentlyProcessedOutput];
            break;
            //突起
        case TypeBulgeDistortion:
            outputImage = [(GPUImageBulgeDistortionFilter *)currentFilter imageFromCurrentlyProcessedOutput];
            break;
        default:
            break;
    }
//    outputImageView = [[UIImageView alloc] initWithImage:outputImage];
//    UIGraphicsBeginImageContext(outputImageView.bounds.size);
//    [outputImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage * temp = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    UIImageWriteToSavedPhotosAlbum(temp, nil, nil, nil);
    UIImageWriteToSavedPhotosAlbum(outputImage, nil, nil, nil);
}

- (IBAction)pressSaveButton:(id)sender
{
    [self saveImage];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示~" message:@"保存成功" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //显示Alert
    [alert show];
//    [self.presentedViewController.view removeFromSuperview];
//    [self.presentingViewController init];
//    [self.presentingViewController dismissViewControllerAnimated:NO completion:^(void){
//    
//    }];
    
//    [self didMoveToParentViewController:self.parentViewController];
//    [self dismissViewControllerAnimated:YES completion:^(void){

//        
//    }];
//    [self dismissModalViewControllerAnimated:YES];
}

- (void)setInputImage:(UIImage *)theImage
{
    inputImage = theImage;
}

- (IBAction)pressGetbackButton:(id)sender
{
    AppDelegate * appDelegate = [[UIApplication sharedApplication] delegate];
//    [(ViewController *)appDelegate.viewController getbackView];
    [appDelegate originalView];
}

@end
