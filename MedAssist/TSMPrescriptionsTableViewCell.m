//
//  TSMPrescriptionsTableViewCell.m
//  MedAssist
//
//  Created by Ariana Williams on 2014-10-16.
//  Copyright (c) 2014 Team Salveo. All rights reserved.
//

#import "TSMPrescriptionsTableViewCell.h"

@implementation TSMPrescriptionsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
