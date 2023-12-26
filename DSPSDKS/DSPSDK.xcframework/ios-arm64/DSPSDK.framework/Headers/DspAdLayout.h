//
//  DspAdLayout.h
//  DSPSDK
//
//  Created by Robin on 2021/1/18.
//

#import <DSPSDK/DspObject.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * _Nonnull  const Dsp_Location_Center;
extern NSString * _Nonnull  const Dsp_Location_Left;
extern NSString * _Nonnull  const Dsp_Location_Top;
extern NSString * _Nonnull  const Dsp_Location_Right;
extern NSString * _Nonnull  const Dsp_Location_Bottom;
@interface DspAdLayout : DspObject

@property(nonatomic,copy) NSString *content_edge;
@property(nonatomic,copy) NSString *image_location;
@property(nonatomic,copy) NSString *image_size;
@property(nonatomic,copy) NSString *title_Size;
@property(nonatomic,copy) NSString *title_Color;
@property(nonatomic,copy) NSString *desc_Size;
@property(nonatomic,copy) NSString *desc_Color;

@end

NS_ASSUME_NONNULL_END
