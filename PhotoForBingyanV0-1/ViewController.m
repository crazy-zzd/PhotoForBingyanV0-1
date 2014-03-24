//
//  ViewController.m
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-7.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theShowVC;
@synthesize theChooseVC;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化子视图
    
//    theChooseVC = [[ShowViewController alloc] init];
    theShowVC = [[ShowViewController alloc] initWithNibName:@"ShowViewController" bundle:nil];
    [self addChildViewController:theShowVC];

    
    //初始化父视图
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self.view insertSubview:theShowVC.view atIndex:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)getbackView
{
    [self transitionFromViewController:theChooseVC toViewController:theShowVC duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL finished){}];
    

}

- (void)getforwardView
{
    theChooseVC = [[ChooseViewController alloc] initWithNibName:@"ChooseViewController" bundle:nil];
    [theChooseVC setInputImage:theInputImage];
    [self addChildViewController:theChooseVC];
        [self transitionFromViewController:theShowVC toViewController:theChooseVC duration:2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{} completion:^(BOOL finished){}];
}

- (void)setInputImage:(UIImage *)theImage
{
    theInputImage = theImage;
    [theShowVC setInputImage:theInputImage];
    [theChooseVC setInputImage:theInputImage];

}

@end
