//
//  MKConsole.m
//  DSPDemo
//
//  Created by 麻明康 on 2024/2/20.
//

#import "MKConsole.h"
@interface MKConsole()
@property (nonatomic, weak) UIWindow *keyWindow;
@property (nonatomic, strong) UIButton *cleanBtn;
@property (nonatomic, strong) UIButton *foldBtn;
@end

@implementation MKConsole
+ (id)shared{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

#pragma mark =============== Core Function ===============
void MKLog(NSString *format, ...){
    va_list args;
    va_start(args, format);
    NSString *formattedString = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    [[MKConsole shared] log:formattedString];
}

-(void)log:(NSString *)format{
    NSLog(@"%@", format);
    NSString *oldText = self.textView.text;
    self.textView.text = [NSString stringWithFormat:@"%@%@\n",oldText,format];
    
    [self.textView setNeedsLayout];
    
    NSRange range = NSMakeRange(self.textView.text.length - 1, 1);
    [self.textView scrollRangeToVisible:range];
}

- (UIWindow *)getKeyWindow {
    if([[[UIApplication sharedApplication] delegate] respondsToSelector:@selector(window)]&&[[[UIApplication sharedApplication] delegate] window]){
        return [[[UIApplication sharedApplication] delegate] window];
    }
    
    if (@available(iOS 13.0,*)) {
        NSArray *arr = [[[UIApplication sharedApplication] connectedScenes] allObjects];
        UIWindowScene *windowScene =  (UIWindowScene *)arr[0];
        UIWindow *mainWindow = [windowScene valueForKeyPath:@"delegate.window"];
        if(mainWindow) return mainWindow;
        return [UIApplication sharedApplication].windows.firstObject;
    }
    return [UIApplication sharedApplication].keyWindow;
}


-(void)clean{
    self.textView.text = @"";
}

-(void)fold:(UIButton*)foldBtn{
    foldBtn.selected = !foldBtn.selected;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        UIEdgeInsets safeAreaInsets = [UIApplication sharedApplication].windows[0].safeAreaInsets;
        CGFloat safeAreaHeight = (safeAreaInsets.bottom != 0)?safeAreaInsets.bottom:0;
        if (foldBtn.selected) {
            weakSelf.textView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width,0);
            weakSelf.foldBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-110, [UIScreen mainScreen].bounds.size.height-safeAreaHeight-20, 40, 20);
            weakSelf.cleanBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height-safeAreaHeight-20, 40, 20);
        }else{
            weakSelf.textView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-105, [UIScreen mainScreen].bounds.size.width,100);
            weakSelf.foldBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-110, [UIScreen mainScreen].bounds.size.height-105-20, 40, 20);
            weakSelf.cleanBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height-105-20, 40, 20);
        }
    }];
}
#pragma mark =============== getter&setter ===============
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-105, [UIScreen mainScreen].bounds.size.width,100) textContainer:nil];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.textColor = [UIColor brownColor];
        _textView.editable = NO;
        _textView.scrollEnabled = YES;
    }
    [self.keyWindow bringSubviewToFront:_textView];
    return _textView;
}

- (UIWindow *)keyWindow{
    if (!_keyWindow) {
        _keyWindow = [self getKeyWindow];
        [_keyWindow addSubview:self.textView];
        [_keyWindow addSubview:self.cleanBtn];
        [_keyWindow addSubview:self.foldBtn];
    }
    return _keyWindow;
}

- (UIButton *)cleanBtn{
    if (!_cleanBtn) {
        _cleanBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-60, [UIScreen mainScreen].bounds.size.height-105-20, 40, 20)];
        [_cleanBtn setTitle:@"清空" forState:UIControlStateNormal];
        [_cleanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cleanBtn.titleLabel.font = [UIFont systemFontOfSize:12.];
        _cleanBtn.layer.cornerRadius = 5.;
        _cleanBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        _cleanBtn.layer.borderWidth = 0.5f;
        [_cleanBtn addTarget:self action:@selector(clean) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.keyWindow bringSubviewToFront:_cleanBtn];
    return _cleanBtn;
}

- (UIButton *)foldBtn{
    if (!_foldBtn) {
        _foldBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-110, [UIScreen mainScreen].bounds.size.height-105-20, 40, 20)];
        [_foldBtn setTitle:@"收起" forState:UIControlStateNormal];
        [_foldBtn setTitle:@"展开" forState:UIControlStateSelected];
        [_foldBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _foldBtn.titleLabel.font = [UIFont systemFontOfSize:12.];
        _foldBtn.layer.cornerRadius = 5.;
        _foldBtn.layer.borderColor = [[UIColor blackColor] CGColor];
        _foldBtn.layer.borderWidth = 0.5f;
        [_foldBtn addTarget:self action:@selector(fold:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self.keyWindow bringSubviewToFront:_foldBtn];
    return _foldBtn;
}
@end