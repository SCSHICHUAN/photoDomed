//
//  GrabCollectionViewCell.m
//  CloudEye
//
//  Created by iOS-PointCompany on 2016/11/8.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "GrabCollectionViewCell.h"
#import "GrabModel.h"

@interface GrabCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@end

@implementation GrabCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setGrabModel:(GrabModel *)grabModel
{
    _grabModel = grabModel;
    _thumbnail.image = grabModel.thumbnail;
}

@end
