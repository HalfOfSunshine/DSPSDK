//
//  DspFullVideoView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/27.
//

#import <DSPSDK/DspView.h>
#import <DSPSDK/DspInfoView.h>
#import <DSPSDK/DspVideoView.h>
#import <DSPSDK/DspImageView.h>


NS_ASSUME_NONNULL_BEGIN

@interface DspFullVideoView : DspView<DspVideoViewDelegate>

@property(nonatomic,strong,readonly) DspImageView *bgImageView;
@property(nonatomic,strong,readonly) DspVideoView *videoPlayView;
@property(nonatomic,strong,readonly) DspInfoView *infoView;
@property (strong, nonatomic) NSMutableDictionary *reportDic;

@property(nonatomic,weak) UIViewController* rootViewController;

-(void)tiggerAccelerometer;

-(void) render;
-(void) start;
-(void) pause;
-(void) close;
@end

NS_ASSUME_NONNULL_END
