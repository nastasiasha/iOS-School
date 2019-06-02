//
//  GRPCustomTableViewCell.m
//  TableTest
//
//  Created by Анастасия Шахлан on 28/05/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "GRPCustomTableViewCell.h"

@interface GRPCustomTableViewCell()

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIImageView *customView;

@end

@implementation GRPCustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
         self.backgroundColor = UIColor.grayColor;
       
        _customView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 90, 40)];
        
        [self.contentView addSubview:_label];
        [self.contentView addSubview:_customView];
    }
    return self;
}

- (void)prepareForReuse
{
    self.label.text = nil;
    self.customView.image = nil;
    [super prepareForReuse];
}

@end
// image = UIImage imageNamed:@"image01"];
