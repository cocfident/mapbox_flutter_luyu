//
//  MapBoxAnnotationView.m
//  flutter_mapbox_gray
//
//  Created by 李运洋 on 2019/12/11.
//

#import "MapBoxAnnotationView.h"
@interface MapBoxAnnotationView ()

/** 标题*/
@property (nonatomic, strong)  UILabel  *titleLbl;

@end


@implementation MapBoxAnnotationView

- (instancetype)initWithAnnotation:(id<MGLAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubviews];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (selected) {

       self.alpha = 1.0;
      
       
    }else{
        self.alpha = 0.3;
       
    }
 
}



- (void)setupSubviews{
    
    self.frame = CGRectMake(0, 0, 40, 40);
    self.layer.cornerRadius = 20.f;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor redColor];
    
    [self addSubview:self.titleLbl];
    
}


- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    _titleLbl.text = titleStr;
}


#pragma mark -- lazy

- (UILabel *)titleLbl{
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
        _titleLbl.textColor = [UIColor whiteColor];
        _titleLbl.font = [UIFont systemFontOfSize:18];
        
    }
    return _titleLbl;
}


@end
