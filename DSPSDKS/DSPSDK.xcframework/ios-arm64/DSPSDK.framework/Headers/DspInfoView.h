//
//  DspInfoView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/27.
//

#import <DSPSDK/DspView.h>

NS_ASSUME_NONNULL_BEGIN

@interface DspInfoView : DspView

+(instancetype) create;
@property (weak, nonatomic) UIView *adView;

@end

NS_ASSUME_NONNULL_END
