//
//  MKConsole.h
//  DSPDemo
//
//  Created by 麻明康 on 2024/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKConsole : NSObject
@property (nonatomic, strong) UITextView *textView;

void MKLog(NSString *format, ...);
//+(void)log:(NSString *)format, ...;
//-(void)log:(NSString *)format, ...;

//FOUNDATION_EXPORT void MKConsole(NSString *format, ...) NS_FORMAT_FUNCTION(1,2) NS_NO_TAIL_CALL;

@end

NS_ASSUME_NONNULL_END
