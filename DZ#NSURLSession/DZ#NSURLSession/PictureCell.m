//
//  PictureCell.m
//  DZ#NSURLSession
//
//  Created by Анастасия Шахлан on 21/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "PictureCell.h"

@implementation PictureCell

- (instancetype) initWithFrame:(CGRect)frame
{
    /*
     super.init(frame: frame)
     imageView = UIImageView()
     imageView.frame = contentView.frame
     contentView.addSubview(imageView)
     
     imageViewBack = UIImageView()
     imageViewBack.frame = contentView.frame
     */
    
    self = [super initWithFrame:frame];
    
    _imageView = [UIImageView new];
    _imageView.frame = self.contentView.frame;
    [self.contentView addSubview:_imageView];
    
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = true;
    self.contentView.backgroundColor = [UIColor colorWithRed:134/225.0 green:185/225.0 blue:227/225.0 alpha:1.0];
    
    _spinner = [[UIActivityIndicatorView alloc] init];
    [self.contentView addSubview:_spinner];
    [_spinner setCenter:self.contentView.center];
    
    //_spinnerKey = NO;
    
    _imageView.layer.cornerRadius = 20;
    self.contentView.layer.cornerRadius = 20;
    
    return self;
}


- (void)prepareForReuse
{
    self.imageView.image = nil;
    
    [super prepareForReuse];
}

@end
