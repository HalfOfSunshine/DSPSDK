//
//  DspView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DspView;
@protocol DspViewDelegate <NSObject>

@optional

-(void) dspViewDidShow:(DspView*) dspView;
-(void) dspViewDidDisappear:(DspView*) dspView;
-(void) dspViewDidClosed:(DspView*) dspView showTimes:(NSInteger) showTimes;
-(void) dspViewDidClicked:(DspView*) dspView source:(NSString*) source reportDic:(nullable NSDictionary *)reportDic;

@end

@interface DspView : UIView
@property(nonatomic,strong) DspAdItem *adItem;
@property(nonatomic,weak) id<DspViewDelegate> delegate;
- (CGFloat)getStatusBarHeight;
-(void) triggerShowEvent;
-(void) triggerDisappearEvent;
-(void) triggerClosedEvent;
-(void) triggerClickedEvent:(NSString*) source reportDic:(nullable NSDictionary *)reportDic;
-(BOOL) isShowingOnKeyWindow;

-(void) onViewShow;
-(void) onViewDisappear;
@end

NS_ASSUME_NONNULL_END
