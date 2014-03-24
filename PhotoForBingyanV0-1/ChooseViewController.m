//
//  ChooseViewController.m
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import "ChooseViewController.h"


@interface ChooseViewController ()

@end

@implementation ChooseViewController

@synthesize theFilterVC;
@synthesize theDecideVC;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor blackColor]];
        
        //按钮初始化
        theFastBlurButton = [self allocButtonWithTitle:FASTBLURBTN_TITLE Rect:CGRectMake(FASTBLURBTN_X, FASTBLURBTN_Y, FILTERBUTTON_LENGTH, FILTERBUTTON_HEIGHT)];
        [theFastBlurButton addTarget:self action:@selector(pressFastBlurBtn:) forControlEvents:UIControlEventTouchUpInside];
        UIImage * tempImg = [UIImage imageNamed:@"mohu.png"];
        [theFastBlurButton setBackgroundImage:tempImg forState:UIControlStateNormal];
        [self.view addSubview:theFastBlurButton];
        
        theSepiaButton = [self allocButtonWithTitle:SEPIABTN_TITLE Rect:CGRectMake(SEPIABTN_X, SEPIABTN_Y, FILTERBUTTON_LENGTH, FILTERBUTTON_HEIGHT)];
        [theSepiaButton addTarget:self action:@selector(pressSepiaBtn:) forControlEvents:UIControlEventTouchUpInside];
        tempImg = [UIImage imageNamed:@"fugu.png"];
        [theSepiaButton setBackgroundImage:tempImg forState:UIControlStateNormal];
        [self.view addSubview:theSepiaButton];
        
        theSketchButton = [self allocButtonWithTitle:SKETCHBTN_TITLE Rect:CGRectMake(SKETCHBTN_X, SKETCHBTN_Y, FILTERBUTTON_LENGTH, FILTERBUTTON_HEIGHT)];
        [theSketchButton addTarget:self action:@selector(pressSketchBtn:) forControlEvents:UIControlEventTouchUpInside];
        tempImg = [UIImage imageNamed:@"sumiao.png"];
        [theSketchButton setBackgroundImage:tempImg forState:UIControlStateNormal];
        [self.view addSubview:theSketchButton];
        
        theBulgeDistortionButton = [self allocButtonWithTitle:BULGEBTN_TITLE Rect:CGRectMake(BULGEBTN_X, BULGEBTN_Y, FILTERBUTTON_LENGTH, FILTERBUTTON_HEIGHT)];
        [theBulgeDistortionButton addTarget:self action:@selector(pressBulgeDistortionBtn:) forControlEvents:UIControlEventTouchUpInside];
        tempImg = [UIImage imageNamed:@"qipao.png"];
        [theBulgeDistortionButton setBackgroundImage:tempImg forState:UIControlStateNormal];
        [self.view addSubview:theBulgeDistortionButton];
        
        //子视图初始化
        theDecideVC = [[DecideViewController alloc]initWithNibName:@"DecideViewController" bundle:nil];
        [self addChildViewController:theDecideVC];
        theFilterVC = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil];
        [self addChildViewController:theFilterVC];

        //主视图初始化
        [self.view insertSubview:theDecideVC.view atIndex:0];
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIButton *)allocButtonWithTitle:(NSString *)title Rect:(CGRect)rect
{
    UIButton * tempBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tempBtn.frame = rect;
    [tempBtn setTitle:title forState:UIControlStateNormal];
    return tempBtn;
}

- (IBAction)pressFastBlurBtn:(id)sender
{
    theFilterVC.typeOfFilter = TypeFastBlur;
    [self changeView];
}

- (IBAction)pressSepiaBtn:(id)sender
{
    theFilterVC.typeOfFilter = TypeSepia;
    [self changeView];

}

- (IBAction)pressSketchBtn:(id)sender
{
    theFilterVC.typeOfFilter = TypeSketch;
    [self changeView];

}

- (IBAction)pressBulgeDistortionBtn:(id)sender
{
    theFilterVC.typeOfFilter = TypeBulgeDistortion;
    [self changeView];

}

- (void)changeView
{
    [self transitionFromViewController:theDecideVC toViewController:theFilterVC duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL finished){}];
}

- (void)setInputImage:(UIImage *)theImage
{
    inputImage = theImage;
    [theFilterVC setInputImage:inputImage];
//    theFilterVC = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil inputImage:inputImage];
//    [self addChildViewController:theFilterVC];

}

@end
