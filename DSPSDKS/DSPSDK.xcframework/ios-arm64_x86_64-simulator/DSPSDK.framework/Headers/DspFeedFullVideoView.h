//
//  DspFeedFullVideoView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/27.
//

#import <DSPSDK/DspFullVideoView.h>
#import <DSPSDK/DSPSDKEnum.h>

NS_ASSUME_NONNULL_BEGIN
@class DspFeedFullVideoView;
@protocol DspFeedFullVideoViewDelegate <DspViewDelegate>

-(void) feedFullVideoViewRenderSuccess:(DspFeedFullVideoView*) dspFeedFullVideoView;
-(void) feedFullVideoViewRenderFail:(DspFeedFullVideoView*) dspFeedFullVideoView error:(NSError*) error;
-(void) feedFullVideoViewStateDidChanged:(DspFeedFullVideoView*) adView state:(DSPMediaPlayerStatus)playerState;
-(void) feedFullVideoViewPlayerDidPlayFinish:(DspFeedFullVideoView*) adView;

@end

@interface DspFeedFullVideoView : DspFullVideoView

@property(nonatomic,weak) UIViewController* rootViewController;

-(void) render;
-(NSString *)identifier;
@end

NS_ASSUME_NONNULL_END
