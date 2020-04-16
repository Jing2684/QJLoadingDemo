////
// QJLoadingDemo
// Created by: ___XQJ___ on 2020/4/13
 

#import "ViewController.h"
#import "UIView+Loading.h"

#define BTN_W 100.f
#define BTN_H 50.f
#define BTN_MARGIN_Y 30.f
#define SHOW_VIEW_X  20.f

@interface ViewController ()
@property (nonatomic, strong) UIButton *startBtn;
@property (nonatomic, strong) UIButton *sucessBtn;
@property (nonatomic, strong) UIButton *failBtn;
@property (nonatomic, strong) UIView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initViews];
}


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

- (void)initViews{
    [self.view addSubview:self.startBtn];
    [self.view addSubview:self.sucessBtn];
    [self.view addSubview:self.failBtn];
    [self.view addSubview:self.showView];
    CGFloat btn_X = (self.view.frame.size.width - BTN_W) *0.5;
    CGFloat showView_W = self.view.frame.size.width - SHOW_VIEW_X * 2;
    self.startBtn.frame = CGRectMake(btn_X, BTN_MARGIN_Y *2, BTN_W, BTN_H);
    self.sucessBtn.frame = CGRectMake(btn_X, CGRectGetMaxY(self.startBtn.frame) + BTN_MARGIN_Y, BTN_W, BTN_H);
    self.failBtn.frame = CGRectMake(btn_X, CGRectGetMaxY(self.sucessBtn.frame) + BTN_MARGIN_Y, BTN_W, BTN_H);
     CGFloat showView_H = self.view.bounds.size.height - CGRectGetMaxY(self.failBtn.frame) - BTN_MARGIN_Y *2;
    self.showView.frame = CGRectMake(SHOW_VIEW_X, CGRectGetMaxY(self.failBtn.frame) + BTN_MARGIN_Y, showView_W, showView_H);
}


- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [[UIButton alloc]init];
        [_startBtn setTitle:@"开始" forState:UIControlStateNormal];
        [_startBtn setBackgroundColor:[UIColor systemPinkColor]];
        [_startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}

- (UIButton *)sucessBtn{
    if (!_sucessBtn) {
        _sucessBtn = [[UIButton alloc]init];
        [_sucessBtn setTitle:@"成功" forState:UIControlStateNormal];
        [_sucessBtn setBackgroundColor:[UIColor systemPinkColor]];
        [_sucessBtn addTarget:self action:@selector(sucessBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sucessBtn;
}

- (UIButton *)failBtn{
    if (!_failBtn) {
        _failBtn = [[UIButton alloc]init];
        [_failBtn setTitle:@"失败" forState:UIControlStateNormal];
        [_failBtn setBackgroundColor:[UIColor systemPinkColor]];
        [_failBtn addTarget:self action:@selector(failBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _failBtn;
}

-(UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc]init];
        _showView.backgroundColor = [UIColor yellowColor];
    }
    return _showView;
}

- (void)startBtnClick{
    [self.showView qj_showLoading];
    
}

- (void)sucessBtnClick{
    [self.showView qj_showSucess:@"加载成功" completeBlock:^{
        NSLog(@"加载成功");
    }];
    
}

- (void)failBtnClick{
    [self.showView qj_showFail:@"加载失败" completeBlock:^{
         NSLog(@"加载失败");
    }];
}

@end
