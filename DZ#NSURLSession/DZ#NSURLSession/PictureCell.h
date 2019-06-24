//
//  PictureCell.h
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PictureCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIActivityIndicatorView *spinner;
- (instancetype) initWithFrame:(CGRect)frame;


@end

NS_ASSUME_NONNULL_END
