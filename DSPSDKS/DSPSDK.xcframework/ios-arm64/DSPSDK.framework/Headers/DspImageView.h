//
//  DspImageView.h
//  DSPSDK
//
//  Created by Robin on 2021/1/20.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface DspImageView : UIImageView
- (void)dsp_setImageWithURLStr:(NSString *)urlStr;
-(void)tiggerAccelerometer;

@property (strong, nonatomic) NSMutableDictionary *reportDic;
@end

NS_ASSUME_NONNULL_END
