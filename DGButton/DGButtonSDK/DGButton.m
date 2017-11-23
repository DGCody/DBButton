//
//  DGButton.m
//  DGButton
//
//  Created by Cody on 2017/11/22.
//  Copyright © 2017年 Cody. All rights reserved.
//

#import "DGButton.h"
#import "Masonry.h"

@interface DGButton()

@property (strong , nonatomic)NSMutableDictionary <NSNumber * , UIImage  *>* stateImages;
@property (strong , nonatomic)NSMutableDictionary <NSNumber * , NSString *>* stateTitles;
@property (strong , nonatomic)NSMutableDictionary <NSNumber * , UIColor  *>* stateTitleColors;
@property (strong , nonatomic)NSMutableDictionary <NSNumber * , UIColor  *>* stateBackgroundColors;
@property (strong , nonatomic)NSMutableDictionary <NSNumber * , NSAttributedString *> *stateAttributedStrings;

@property (strong , nonatomic)UIImageView * imageView;
@property (strong , nonatomic)UILabel * titleLabel;
@property (strong , nonatomic)UIView * contentView;

@end

@implementation DGButton{
    __weak id _target;
}

#pragma mark - init
+ (instancetype)buttonArrangeType:(DGButtonArrangeType)arrangeType{
    return [[DGButton alloc] initWithArrangeType:arrangeType];
}

- (instancetype)initWithArrangeType:(DGButtonArrangeType)arrangeType{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        self.arrangeType = arrangeType;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //默认属性
        self.stateImages            = @{@(UIControlStateNormal):[UIImage new]}.mutableCopy;
        self.stateTitles            = @{@(UIControlStateNormal):@""}.mutableCopy;
        self.stateTitleColors       = @{@(UIControlStateNormal):[UIColor cyanColor]}.mutableCopy;
        self.stateBackgroundColors  = @{@(UIControlStateNormal):[UIColor whiteColor]}.mutableCopy;
        self.stateAttributedStrings = @{}.mutableCopy;
        self.touchAnimationDuration = -1;
    }
    return self;
}

#pragma mark - updateFrame
- (void)layoutSubviews{
    [super layoutSubviews];
    [self updateFrame];
}

- (void)updateConstraints {
    [super updateConstraints];
}

- (void)updateFrame{
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(self.contentEdgeInsets.top));
        make.bottom.equalTo(@(-self.contentEdgeInsets.bottom));
        make.left.equalTo(@(self.contentEdgeInsets.left));
        make.right.equalTo(@(-self.contentEdgeInsets.right));
    }];
    
    switch (self.arrangeType) {
        case DGButtonArrangeTypeTitleInFrontOfTheImage:
        default:
        {
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY).offset(self.titleEdgeInsets.top);
                make.left.equalTo(@(self.titleEdgeInsets.left+[self startLeft]));
            }];
            
            [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.titleLabel.mas_right).offset(self.imageEdgeInsets.left+self.titleEdgeInsets.right);
                
                if (self.alignmentType == DGButtonAlignmentTypeTop){
                    make.top.equalTo(self.titleLabel.mas_top).offset(self.imageEdgeInsets.top);
                }else if (self.alignmentType == DGButtonAlignmentTypeBottom){
                    make.bottom.equalTo(self.titleLabel).offset(self.imageEdgeInsets.bottom);
                }else {
                    make.centerY.equalTo(self.contentView.mas_centerY).offset(self.imageEdgeInsets.top);
                }
            }];
        }
            break;
        case DGButtonArrangeTypeImageInFrontOfTheTitle:
        {
            
            [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY).offset(self.imageEdgeInsets.top);
                make.left.equalTo(@(self.imageEdgeInsets.left+[self startLeft]));
            }];
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.imageView.mas_right).offset(self.titleEdgeInsets.left+self.imageEdgeInsets.right);
                if (self.alignmentType == DGButtonAlignmentTypeTop){
                    make.top.equalTo(self.imageView.mas_top).offset(self.titleEdgeInsets.top);
                }else if (self.alignmentType == DGButtonAlignmentTypeBottom){
                    make.bottom.equalTo(self.imageView.mas_bottom).offset(self.titleEdgeInsets.bottom);
                }else{
                    make.centerY.equalTo(self.contentView.mas_centerY).offset(self.titleEdgeInsets.top);
                }
            }];
            
        }
            break;
        case DGButtonArrangeTypeTitleAboveTheImage:
        {
            [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(self.titleEdgeInsets.top + [self startTop]));
                make.centerX.equalTo(self.contentView.mas_centerX).offset(self.titleEdgeInsets.left);
            }];
            
            [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLabel.mas_bottom).offset(self.imageEdgeInsets.top+self.titleEdgeInsets.bottom);
                
                if (self.alignmentType == DGButtonAlignmentTypeLeft){
                    make.left.equalTo(self.titleLabel).offset(self.imageEdgeInsets.left);
                }else if (self.alignmentType == DGButtonAlignmentTypeRight){
                    make.right.equalTo(self.titleLabel).offset(self.imageEdgeInsets.right);
                }else{
                    make.centerX.equalTo(self.contentView.mas_centerX).offset(self.imageEdgeInsets.left);
                }

            }];
            
        }
            break;
        case DGButtonArrangeTypeImageAboveTheTitle:
        {
            [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@(self.imageEdgeInsets.top + [self startTop]));
                make.centerX.equalTo(self.contentView.mas_centerX).offset(self.imageEdgeInsets.left);
            }];
            
            [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.imageView.mas_bottom).offset(self.titleEdgeInsets.top+self.imageEdgeInsets.bottom);
                 if (self.alignmentType == DGButtonAlignmentTypeLeft){
                    make.left.equalTo(self.imageView).offset(self.titleEdgeInsets.left);
                }else if (self.alignmentType == DGButtonAlignmentTypeRight){
                    make.right.equalTo(self.imageView).offset(self.titleEdgeInsets.right);
                }else{
                    make.centerX.equalTo(self.contentView.mas_centerX).offset(self.titleEdgeInsets.left);
                }

            }];
        }
            break;
    }
    
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.imageSize.height));
        make.width.equalTo(@(self.imageSize.width));
    }];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.lessThanOrEqualTo(@([self titleSize].width+2));
    }];
    
}

#pragma mark - get
- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.clipsToBounds = YES;
        _contentView.userInteractionEnabled = NO;
        [self addSubview:_contentView];
    }
    return _contentView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = self.titleFont;
        _titleLabel.textColor = self.stateTitleColors[@(UIControlStateNormal)];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

//字体默认大小15
- (UIFont *)titleFont{
    if (!_titleFont) {
        _titleFont = [UIFont systemFontOfSize:15];
    }
    return _titleFont;
}

//起始x
- (CGFloat)startLeft{
    CGFloat left = (self.contentView.bounds.size.width - (self.titleSize.width + self.imageSize.width + self.imageEdgeInsets.left + self.titleEdgeInsets.left))/2.0f;
    return left;
}

//起始y
- (CGFloat)startTop{
    CGFloat top = (self.contentView.bounds.size.height - (self.titleSize.height + self.imageSize.height + self.imageEdgeInsets.top + self.titleEdgeInsets.top))/2.0f;
    return top;
}

//title内容大小
- (CGSize)titleSize{
    CGSize titleSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake(self.maxTitleWidth, self.titleFont.lineHeight)
                                                          options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                                       attributes:@{NSFontAttributeName:self.titleFont}
                                                          context:nil].size;
    return titleSize;
}

//文本最大宽度
- (CGFloat)maxTitleWidth{
    if (self.arrangeType == DGButtonArrangeTypeTitleInFrontOfTheImage ||
        self.arrangeType == DGButtonArrangeTypeImageInFrontOfTheTitle) {
        CGFloat width = self.contentView.bounds.size.width - self.imageSize.width;
        if (width >0)return width;
        return 0;
    }
    return self.contentView.bounds.size.width;
}

//默认动画时长0.2s
- (NSTimeInterval)touchAnimationDuration{
    if (_touchAnimationDuration == -1) {
        return 0.2;
    }
    return _touchAnimationDuration;
}

#pragma mark - set
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    self.stateImages[@(state)] = image;
    if ((state == UIControlStateNormal)||
        (self.selected && state == UIControlStateSelected)) {
        self.imageView.image = image;
        
        //设置默认imageView的大小为图片尺寸信息
        if (self.imageSize.height == 0 && self.imageSize.width == 0) {
            CGFloat imageWidth =(image.size.width < CGRectGetWidth(self.bounds))? image.size.width:CGRectGetWidth(self.bounds);
            CGFloat imageHeight = imageWidth * (image.size.width/image.size.height);
            imageWidth = (imageWidth < CGRectGetHeight(self.bounds))? imageWidth:CGRectGetHeight(self.bounds);
            self.imageSize = CGSizeMake(imageWidth, imageHeight);
        }
    }

}

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    self.stateTitles[@(state)] = title;
    if ((state == UIControlStateNormal)||
        (self.selected && state == UIControlStateSelected)){
        self.titleLabel.text = title;
    }
    [self updateFrame];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    self.stateTitleColors[@(state)] = color;
    if ((state == UIControlStateNormal)||
        (self.selected && state == UIControlStateSelected)){
        self.titleLabel.textColor = color;
    }}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    self.stateBackgroundColors[@(state)] = backgroundColor;
    if ((state == UIControlStateNormal)||
        (self.selected && state == UIControlStateSelected)){
        [self dg_setBackgroundColor:backgroundColor];
    }
}

- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state{
    self.stateAttributedStrings[@(state)] = title;
    if ((state == UIControlStateNormal)||
        (self.selected && state == UIControlStateSelected)){
        self.titleLabel.attributedText = title;
    }
}


- (void)setImageSize:(CGSize)imageSize{
    _imageSize = imageSize;
    CGRect rect = self.imageView.bounds;
    rect.size = imageSize;
    self.imageView.bounds = rect;
    [self updateFrame];
}

- (void)setArrangeType:(DGButtonArrangeType)arrangeType{
    _arrangeType = arrangeType;
}

#pragma mark - public


#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    
    [UIView animateWithDuration:self.touchAnimationDuration animations:^{
        UIImage * image = self.stateImages[@(UIControlStateHighlighted)];
        if (image)self.imageView.image = image;
        else self.imageView.alpha = 0.5;
        
        NSString * title = self.stateTitles[@(UIControlStateHighlighted)];
        if (title) self.titleLabel.text = title;
        
        UIColor * titleColor = self.stateTitleColors[@(UIControlStateHighlighted)];
        if(titleColor)self.titleLabel.textColor = titleColor;
        else self.titleLabel.alpha = 0.5;
        
        UIColor *backgroundColor = self.stateBackgroundColors[@(UIControlStateHighlighted)];
        if (backgroundColor) [self dg_setBackgroundColor:backgroundColor];
    }];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    [self endTouch];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
    [self endTouch];
}


- (void)endTouch{
    [UIView animateWithDuration:self.touchAnimationDuration animations:^{
        
        if (self.selected) {
            if(self.stateImages[@(UIControlStateSelected)])self.imageView.image = self.stateImages[@(UIControlStateSelected)];
            else self.imageView.image = self.stateImages[@(UIControlStateNormal)];
            
            if(self.stateTitles[@(UIControlStateSelected)])self.titleLabel.text = self.stateTitles[@(UIControlStateSelected)];
            else self.titleLabel.text = self.stateTitles[@(UIControlStateNormal)];
            
            if(self.stateTitleColors[@(UIControlStateSelected)])self.titleLabel.textColor = self.stateTitleColors[@(UIControlStateSelected)];
            else self.titleLabel.textColor = self.stateTitleColors[@(UIControlStateNormal)];
            
            if (self.stateBackgroundColors[@(UIControlStateSelected)])[self dg_setBackgroundColor:self.stateBackgroundColors[@(UIControlStateSelected)]];
            else [self dg_setBackgroundColor: self.stateBackgroundColors[@(UIControlStateNormal)]];
            
        }else{
            self.imageView.image = self.stateImages[@(UIControlStateNormal)];
            self.titleLabel.text = self.stateTitles[@(UIControlStateNormal)];
            self.titleLabel.textColor = self.stateTitleColors[@(UIControlStateNormal)];
            [self dg_setBackgroundColor: self.stateBackgroundColors[@(UIControlStateNormal)]];
        }
        
        self.titleLabel.alpha = 1.0f;
        self.imageView.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - overwrite
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [super addTarget:target action:action forControlEvents:controlEvents];
}


- (void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    if (__changeBackgroundColorNormalValue) {
        self.stateBackgroundColors[@(UIControlStateNormal)] =backgroundColor;
    }
}

- (void)setEnabled:(BOOL)enabled{
    [super setEnabled:enabled];
    
    if (enabled) {
        self.imageView.image = self.stateImages[@(UIControlStateNormal)];
        self.titleLabel.text = self.stateTitles[@(UIControlStateNormal)];
        self.titleLabel.textColor = self.stateTitleColors[@(UIControlStateNormal)];
        [self dg_setBackgroundColor: self.stateBackgroundColors[@(UIControlStateNormal)]];

    }else{
        UIImage * image = self.stateImages[@(UIControlStateDisabled)];
        if (image)self.imageView.image = image;
        
        NSString * title = self.stateTitles[@(UIControlStateDisabled)];
        if (title) self.titleLabel.text = title;
        
        UIColor * titleColor = self.stateTitleColors[@(UIControlStateDisabled)];
        if(titleColor)self.titleLabel.textColor = titleColor;
        
        UIColor *backgroundColor = self.stateBackgroundColors[@(UIControlStateDisabled)];
        if (backgroundColor) [self dg_setBackgroundColor:backgroundColor];
    }
    
}

static bool __changeBackgroundColorNormalValue = YES;
- (void)dg_setBackgroundColor:(UIColor *)backgroundColor{
    __changeBackgroundColorNormalValue = NO;
    self.backgroundColor = backgroundColor;
    __changeBackgroundColorNormalValue = YES;
}

@end
