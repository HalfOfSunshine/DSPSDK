//
//  DspAdItem.h
//  DSPSDK
//
//  Created by Robin on 2021/1/18.
//

#import <DSPSDK/DspObject.h>
#import <DSPSDK/DspAdCard.h>
#import <DSPSDK/DspAdVideo.h>
#import <DSPSDK/DspAdAction.h>
#import <DSPSDK/DspAdLayout.h>
NS_ASSUME_NONNULL_BEGIN

@interface DspAdItem : DspObject

@property(nonatomic,copy) NSString *zjad_id;
@property(nonatomic,copy) NSString *ad_id;
@property(nonatomic,copy) NSString *trade_id;
@property(nonatomic,copy) NSString *ad_type;
@property(nonatomic,copy) NSString *ad_item_id;
@property(nonatomic,copy) NSString *order_no;
@property(nonatomic,copy) NSString *company_name;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *logo;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *image;
//@property(nonatomic,copy) NSString *image_thumb;
@property(nonatomic,assign) NSInteger valid_duration;
//int 类型，单位分，-1 为非 bidding，大于等于0 bidding 价格
@property(nonatomic,assign) NSInteger price;

@property(nonatomic,assign) NSInteger bidEcpm;

@property(nonatomic,assign) BOOL areaEnable;

@property(nonatomic,strong) DspAdCard *card_info;
@property(nonatomic,strong) DspAdVideo *video;
@property(nonatomic,strong) DspAdAction *click_action;
@property(nonatomic,strong) DspAdLayout *adLayout;
@property (nonatomic, copy) NSArray *click_notice_urls;
@property (nonatomic, copy) NSArray *impress_notice_urls;

@end

NS_ASSUME_NONNULL_END
