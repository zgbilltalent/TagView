//
//  ViewController.m
//  TageViewDemo
//
//  Created by 张盖 on 2018/12/16.
//  Copyright © 2018 Bill. All rights reserved.
//

#import "ViewController.h"
#import "ZGTagView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZGTagView *mt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZGTagView *view = [[ZGTagView alloc] initWithFrame:CGRectMake(0, 200, 300, 400)];
    [self.view addSubview:view];
    NSArray *string = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
    [view setArr:string];
    
    
    [self.mt setArr:string];
}


@end
