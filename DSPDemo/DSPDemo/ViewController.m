//
//  ViewController.m
//  DSPDemo
//
//  Created by 麻明康 on 2023/12/20.
//

#import "ViewController.h"
#import "UIButton+FunctionExpansion.h"
#import <DSPSDK/DSPSDK.h>

@interface ViewController ()<DspRewardVideoAdProviderDelegate>
{
    DspRewardVideoAd *_dspRewardVideoAd;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *loadBtn = [UIButton buttonWithFrame:CGRectMake(100, 200, 100, 100) title:@"拉取激励视频" titleColor:[UIColor blackColor] backgroundColor:[UIColor yellowColor] font:[UIFont systemFontOfSize:14] normalImage:nil highlightedImage:nil backgroundImage:nil target:self selector:@selector(loadAD)];
    [self.view addSubview:loadBtn];
    
    UIButton *showBtn = [UIButton buttonWithFrame:CGRectMake(100, 350, 100, 100) title:@"展示激励视频" titleColor:[UIColor blackColor] backgroundColor:[UIColor yellowColor] font:[UIFont systemFontOfSize:14] normalImage:nil highlightedImage:nil backgroundImage:nil target:self selector:@selector(showAD)];
    [self.view addSubview:showBtn];
}


-(void)loadAD{
    _dspRewardVideoAd = [DspRewardVideoAd new];
    _dspRewardVideoAd.zjad_id = @"zjad_iOS_ZR0001";
    _dspRewardVideoAd.ad_id = @"zjad_iOS_ZR0001";
    _dspRewardVideoAd.ad_type = DspADType_RewardVideo;
    _dspRewardVideoAd.delegate = self;

    NSDictionary *params = @{
        @"image_height":[NSNumber numberWithDouble:[UIScreen mainScreen].bounds.size.height],
        @"image_width":[NSNumber numberWithDouble:[UIScreen mainScreen].bounds.size.width]
    };
    [_dspRewardVideoAd loadAdDate:params];
}

-(void)showAD{
    if(_dspRewardVideoAd){
        [_dspRewardVideoAd showAdInViewController:self];
    }
}

#pragma mark DspRewardVideoAdProviderDelegate

- (void)dspAdLoadFail:(nonnull DspAd *)dspAd error:(nonnull NSError *)error {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspAdLoadSuccessful:(nonnull DspAd *)dspAd {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdVideoDidLoad:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdDidShow:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdDidClicked:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdDidClose:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdDidRewardEffective:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)dspRewardVideoAdDidPlayFinish:(nonnull DspRewardVideoAd *)provider {
    NSLog(@"======%s",__FUNCTION__);
}

- (void)DspRewardVideoAd:(nonnull DspRewardVideoAd *)provider didFailWithError:(nonnull NSError *)error {
    NSLog(@"======%s",__FUNCTION__);
}


#pragma mark =============== 竞胜竞败 二价上报 ================
- (NSInteger)eCPM{
    return [_dspRewardVideoAd getEcpm];
}

- (void)biddingSuccess:(NSInteger )secondPrice{
    [_dspRewardVideoAd setBidEcpm:secondPrice];
}



@end
