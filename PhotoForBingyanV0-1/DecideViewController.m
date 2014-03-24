//
//  DecideViewController.m
//  PhotoForBingyanV0-1
//
//  Created by 朱 俊健 on 13-10-8.
//  Copyright (c) 2013年 朱 俊健. All rights reserved.
//

#import "DecideViewController.h"

@interface DecideViewController ()

@end

@implementation DecideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpeg"]]];

//        [self.view setBackgroundColor:[UIColor blackColor]];
        // Custom initialization
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

@end
