//
//  ViewController.m
//  NodeJS
//
//  Created by owen on 2019/7/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *clickBtn;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}
- (void)configUI{
    self.clickBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, self.view.bounds.size.width -100, 50)];
    [self.view addSubview:self.clickBtn];
    self.clickBtn.backgroundColor = [UIColor redColor];
    [self.clickBtn setTitle:@"Call Process Versions" forState:UIControlStateNormal];
    [self.clickBtn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 200)];
    [self.view addSubview:self.textView];
    self.textView.backgroundColor = [UIColor brownColor];
    self.textView.textColor = [UIColor whiteColor];
}
- (void)clickAction{
    NSString *localNodeServerURL = @"http:/127.0.0.1:3000/";
    NSURL  *url = [NSURL URLWithString:localNodeServerURL];
    NSString *versionsData = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    if (versionsData){
        self.textView.text = versionsData;
    }
}
@end
