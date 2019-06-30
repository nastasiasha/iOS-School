//
//  CustomTableViewCell.m
//  DZ#CoreData
//
//  Created by Анастасия Шахлан on 30/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "CustomTableViewCell.h"

@interface CustomTableViewCell()

@property (nonatomic,strong) UILabel *label;

@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _label = [[UILabel alloc] initWithFrame:self.frame];
        _label.text = @"test";
        [self.contentView addSubview:_label];
    }
    return self;
}


- (void)prepareForReuse
{
    self.label.text = nil;
    [super prepareForReuse];
}

@end
