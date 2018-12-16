//
//  ZGTagView.h
//  TageViewDemo
//
//  Created by 张盖 on 2018/12/16.
//  Copyright © 2018 Bill. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ZGTagViewDelegate <NSObject>

@optional

-(void)handleSelectTag:(NSString *)keyWord;

@end
@interface ZGTagView : UIView
@property (nonatomic ,weak)id <ZGTagViewDelegate>delegate;

@property (nonatomic ,strong)NSArray * arr;

@property (nonatomic ,strong)NSArray * arrColor;

@end

NS_ASSUME_NONNULL_END
