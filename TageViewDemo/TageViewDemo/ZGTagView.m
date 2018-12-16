//
//  ZGTagView.m
//  TageViewDemo
//
//  Created by 张盖 on 2018/12/16.
//  Copyright © 2018 Bill. All rights reserved.
//
/** 屏幕宽度 */
#define KYScreenWidth ([UIScreen mainScreen].bounds.size.width)

#import "ZGTagView.h"

@implementation ZGTagView


-(void)setArr:(NSArray *)arr{
    _arr = arr;
    CGFloat marginX = 15;
    CGFloat marginY = 10;
    CGFloat height = 28;
    UIButton * markBtn;
    for (int i = 0; i < _arr.count; i++) {
        CGFloat width =  [self calculateString:_arr[i] Width:12] +20;
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!markBtn) {
            tagBtn.frame = CGRectMake(marginX, marginY, width, height);
        }else{
            if (markBtn.frame.origin.x + markBtn.frame.size.width + marginX + width + marginX > KYScreenWidth) {
                tagBtn.frame = CGRectMake(marginX, markBtn.frame.origin.y + markBtn.frame.size.height + marginY, width, height);
            }else{
                tagBtn.frame = CGRectMake(markBtn.frame.origin.x + markBtn.frame.size.width + marginX, markBtn.frame.origin.y, width, height);
            }
        }
        [tagBtn setTitle:_arr[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [tagBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [tagBtn setBackgroundColor:[UIColor redColor]  forState:UIControlStateNormal];
        [tagBtn setBackgroundColor:[UIColor redColor]];
        
        [self makeCornerRadius:6 borderColor:[UIColor blackColor] layer:tagBtn.layer borderWidth:.5];
        markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:markBtn];
    }
    CGRect rect = self.frame;
    rect.size.height = markBtn.frame.origin.y + markBtn.frame.size.height + marginY;
    self.frame = rect;
}


-(void)setArrColor:(NSArray *)arrColor{
    _arrColor = arrColor;
    CGFloat marginX = 15;
    CGFloat marginY = 10;
    CGFloat height = 28;
    UIButton * markBtn;
    for (int i = 0; i < _arrColor.count; i++) {
        CGFloat width =  [self calculateString:_arrColor[i] Width:12] +20;
        UIButton * tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!markBtn) {
            tagBtn.frame = CGRectMake(marginX, marginY, width, height);
        }else{
            if (markBtn.frame.origin.x + markBtn.frame.size.width + marginX + width + marginX > KYScreenWidth) {
                tagBtn.frame = CGRectMake(marginX, markBtn.frame.origin.y + markBtn.frame.size.height + marginY, width, height);
            }else{
                tagBtn.frame = CGRectMake(markBtn.frame.origin.x + markBtn.frame.size.width + marginX, markBtn.frame.origin.y, width, height);
            }
        }
        [tagBtn setTitle:_arrColor[i] forState:UIControlStateNormal];
        tagBtn.titleLabel.font = [UIFont systemFontOfSize:12];
//        [tagBtn setTitleColor:[UIColor hex0E1932] forState:UIControlStateNormal];
//        [tagBtn setBackgroundColor:[UIColor colorWithHexString:@"#F0F2F4"] forState:UIControlStateNormal];
        [self makeCornerRadius:6 borderColor:[UIColor blackColor] layer:tagBtn.layer borderWidth:.5];
        markBtn = tagBtn;
        
        [tagBtn addTarget:self action:@selector(clickTo:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:markBtn];
    }
    CGRect rect = self.frame;
    rect.size.height = markBtn.frame.origin.y + markBtn.frame.size.height + marginY;
    self.frame = rect;
}
-(void)clickTo:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(handleSelectTag:)]) {
        [self.delegate handleSelectTag:sender.titleLabel.text];
    }
}



-(void)makeCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor layer:(CALayer *)layer borderWidth:(CGFloat)borderWidth
{
    layer.cornerRadius = radius;
    layer.masksToBounds = YES;
    layer.borderColor = borderColor.CGColor;
}

-(CGFloat)calculateString:(NSString *)str Width:(NSInteger)font
{
    CGSize size = [str boundingRectWithSize:CGSizeMake(KYScreenWidth, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil].size;
    return size.width;
}
@end
