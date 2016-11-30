//
//  GrabModel.h
//  CloudEye
//
//  Created by iOS-PointCompany on 2016/11/8.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GrabModel : NSObject
@property(nonatomic,strong)NSString *grabPath;
@property(nonatomic,strong)UIImage *thumbnail;

-(instancetype)initWithGrabModelModelDictionary:(NSDictionary*)dict;
+(instancetype)GrabModelDictionary:(NSDictionary*)dict;

@end
