//
//  DspSplashView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/19.
//

#import <DSPSDK/DspView.h>

NS_ASSUME_NONNULL_BEGIN

@class DspSplashView;
@protocol DspSplashViewDelegate <DspViewDelegate>
-(void) dspSplashViewCountDownEnd:(DspSplashView*) dspSplashView;
@optional



@end

@interface DspSplashView : DspView

@property(nonatomic,copy) NSString *imageUrl;
@property(nonatomic,assign) NSInteger shkipTimes;

@property(nonatomic,assign) BOOL areaEnable;
@property(nonatomic,copy) NSString *shake_power;
@property(nonatomic,weak) id<DspSplashViewDelegate> delegate;
-(void)startAccelerometer;
@end

NS_ASSUME_NONNULL_END
