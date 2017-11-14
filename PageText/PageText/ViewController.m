//
//  ViewController.m
//  PageText
//
//  Created by yaoxb on 2017/11/14.
//  Copyright © 2017年 yaoxb. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"text" ofType:nil];
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:text];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    for (NSInteger i = 0; i < 3; i++) {
        NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:self.view.bounds.size];
        [layoutManager addTextContainer:textContainer];
        CGFloat x = i*self.view.bounds.size.width;
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(x, 0, self.view.bounds.size.width, self.view.bounds.size.height) textContainer:textContainer];
        textView.scrollEnabled = NO;
        [scrollView addSubview:textView];
        scrollView.contentSize = CGSizeMake((i+1)*self.view.bounds.size.width, self.view.bounds.size.height);
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
