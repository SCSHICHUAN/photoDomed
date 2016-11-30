

//
//  GrabModel.m
//  CloudEye
//
//  Created by iOS-PointCompany on 2016/11/8.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "GrabModel.h"

@interface GrabModel()<NSCoding>

@end

@implementation GrabModel

-(instancetype)initWithGrabModelModelDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)GrabModelDictionary:(NSDictionary *)dict
{
    return [[GrabModel alloc] initWithGrabModelModelDictionary:dict];
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.grabPath  forKey:@"grabPath" ];
    [aCoder encodeObject:self.thumbnail forKey:@"thumbnail"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.grabPath  = [aDecoder decodeObjectForKey:@"grabPath" ];
        self.thumbnail = [aDecoder decodeObjectForKey:@"thumbnail"];
        
    }
    return self;
}






@end
