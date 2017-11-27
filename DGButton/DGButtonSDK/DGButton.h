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
    DGButtonArrangeTypeTitleInFrontOfTheImage = 0, //标题在图片前面
    DGButtonArrangeTypeImageInFrontOfTheTitle = 1, //图片在标题前面
    DGButtonArrangeTypeTitleAboveTheImage     = 2, //标题在图片上面
    DGButtonArrangeTypeImageAboveTheTitle     = 3, //图片在标题上面
};

//对齐方式
typedef NS_ENUM(NSInteger, DGButtonAlignmentType){
    DGButtonAlignmentTypeCenter = 0, //居中对齐
    DGButtonAlignmentTypeTop    = 1 << 0,//上对齐
    DGButtonAlignmentTypeLeft   = 1 << 1,//左对齐
    DGButtonAlignmentTypeBottom = 1 << 2,//下对齐
    DGButtonAlignmentTypeRight  = 1 << 3 //右对齐
};


@interface DGButton : UIControl

+ (instancetype)buttonArrangeType:(DGButtonArrangeType)arrangeType;

- (instancetype)initWithArrangeType:(DGButtonArrangeType)arrangeType;

@property (assign , nonatomic)DGButtonArrangeType arrangeType;//排列形式;默认为:DGButtonArrangeTypeTitleInFrontOfTheImage
@property (assign , nonatomic)DGButtonAlignmentType alignmentType;//对齐方式;默认为:DGButtonAlignmentTypeCenter

@property (assign , nonatomic)CGSize imageSize;//设置图片大小，默认：按图片实际大小显示
@property (strong , nonatomic)UIFont *titleFont;//标题字体，默认：系统15号常规

@property (assign , nonatomic)UIEdgeInsets imageEdgeInsets; //图片内边界
@property (assign , nonatomic)UIEdgeInsets titleEdgeInsets; //标题内边界
@property (assign , nonatomic)UIEdgeInsets contentEdgeInsets; //内容内边界

@property (assign ,nonatomic)NSTimeInterval touchAnimationDuration;//点击按钮交互效果的动画时长

- (void)setImage:(UIImage *)image  forState:(UIControlState)state;
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state;


@end




