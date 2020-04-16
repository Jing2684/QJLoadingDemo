////
// QJLoadingDemo
// Created by: ___XQJ___ on 2020/4/13
 

#import "QJLoadingView.h"
#define LOADING_VIEW_WIDTH  80

@interface QJLoadingView ()
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *loadingBgView;
@property (nonatomic, strong) UIActivityIndicatorView * loadingView;
@property (nonatomic, strong) UILabel *tipLabel;
@end

@implementation QJLoadingView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViewStyle];
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setViewStyle];
        [self setupView];
    }
    return self;
}


- (void)setViewStyle{
    self.backgroundColor = [UIColor clearColor];
}


- (void)setupView
{
    self.backgroundView = [[UIView alloc]init];
    [self addSubview:self.backgroundView];
    self.backgroundView.backgroundColor = [UIColor blackColor];
    self.backgroundView.layer.cornerRadius = 5;
    self.backgroundView.layer.masksToBounds = YES;
    self.loadingBgView = [[UIView alloc]init];
    self.loadingBgView.backgroundColor = [UIColor blackColor];
    [self.backgroundView addSubview:self.loadingBgView];
    self.loadingView = [[UIActivityIndicatorView alloc] init];
    self.loadingView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
    [self.loadingBgView addSubview:self.loadingView];
    [self.loadingView startAnimating];
    self.loadingView.userInteractionEnabled = NO;
    self.tipLabel = [[UILabel alloc]init];
    [self.tipLabel setText:@"加载中"];
    [self.tipLabel setFont:[UIFont systemFontOfSize:15.f]];
    self.tipLabel.textColor = [UIColor whiteColor];
    [self.tipLabel setTextAlignment:NSTextAlignmentCenter];
    [self.backgroundView addSubview:self.tipLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.tipLabel sizeToFit];
    CGFloat loadingX = (self.bounds.size.width - LOADING_VIEW_WIDTH) * 0.5;
    CGFloat loadingY = (self.bounds.size.height - LOADING_VIEW_WIDTH) * 0.5;
    self.backgroundView.frame = CGRectMake(loadingX, loadingY, LOADING_VIEW_WIDTH, LOADING_VIEW_WIDTH);
    self.loadingBgView.frame = CGRectMake(LOADING_VIEW_WIDTH * 0.1, 0, LOADING_VIEW_WIDTH * 0.8, LOADING_VIEW_WIDTH * 0.7);
    self.loadingView.center = CGPointMake(self.loadingBgView.frame.size.width * 0.5, self.loadingBgView.frame.size.height * 0.5);
    CGFloat tipLabelX = (self.backgroundView.bounds.size.width - self.tipLabel.frame.size.width) * 0.5;
    self.tipLabel.frame = CGRectMake(tipLabelX,self.backgroundView.bounds.size.height * 0.7,self.tipLabel.frame.size.width ,self.tipLabel.frame.size.height);
}

- (void)setLoadingColor:(UIColor *)loadingColor{
    _loadingColor = loadingColor;
    _loadingView.color = loadingColor;
    _tipLabel.textColor = loadingColor;
}

- (void)setText:(NSString *)text{
    _text = text;
    _tipLabel.text = text;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor = backgroundColor;
    _backgroundView.backgroundColor = backgroundColor;
    
}

@end
