//
//  DGButton.h
//  DGButton
//
//  Created by Cody on 2017/11/22.
//  Copyright © 2017年 Cody. All rights reserved.
//

#import <UIKit/UIKit.h>


//排列形式
typedef NS_ENUM(NSInteger, DGButtonArrangeType) {
    DGButtonArrangeTypeTitleInFrontOfTheImage = 0, //默认方式;标题在图片前面
    DGButtonArrangeTypeImageInFrontOfTheTitle = 1, //图片在标题前面
    DGButtonArrangeTypeTitleAboveTheImage     = 2, //标题在图片上面
    DGButtonArrangeTypeImageAboveTheTitle     = 3, //图片在标题上面
};

//对齐方式
typedef NS_ENUM(NSInteger, DGButtonAlignmentType){
    DGButtonAlignmentTypeCenter = 0, //默认对齐方式;居中对齐
    DGButtonAlignmentTypeTop    = 1 << 0,
    DGButtonAlignmentTypeLeft   = 1 << 1,
    DGButtonAlignmentTypeBottom = 1 << 2,
    DGButtonAlignmentTypeRight  = 1 << 3
};


@interface DGButton : UIControl

+ (instancetype)buttonArrangeType:(DGButtonArrangeType)arrangeType;

- (instancetype)initWithArrangeType:(DGButtonArrangeType)arrangeType;

@property (assign , nonatomic)DGButtonArrangeType arrangeType;//排列形式;默认为:DGButtonArrangeTypeTitleInFrontOfTheImage
@property (assign , nonatomic)DGButtonAlignmentType alignmentType;//对齐方式;默认为:DGButtonAlignmentTypeCenter

@property (assign , nonatomic)CGSize imageSize;
@property (strong , nonatomic)UIFont *titleFont;

@property (assign , nonatomic)UIEdgeInsets imageEdgeInsets;
@property (assign , nonatomic)UIEdgeInsets titleEdgeInsets;
@property (assign , nonatomic)UIEdgeInsets contentEdgeInsets;

@property (assign ,nonatomic)NSTimeInterval touchAnimationDuration;//点击按钮的交互效果的动画时长

- (void)setImage:(UIImage *)image  forState:(UIControlState)state;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

@end




