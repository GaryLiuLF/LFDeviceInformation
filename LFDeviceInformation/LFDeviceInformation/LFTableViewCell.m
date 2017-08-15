//
//  LFTableViewCell.m
//  LFDeviceInformation
//
//  Created by gary.liu on 2017/8/15.
//  Copyright © 2017年 LiuLinFei. All rights reserved.
//

#import "LFTableViewCell.h"

@interface LFTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end


@implementation LFTableViewCell

- (void)layoutSubviews {
    self.infoLabel.text = [NSString stringWithFormat:@"%@", self.infoString];
    self.nameLabel.text = [NSString stringWithFormat:@"%@", self.nameString];
}


@end
