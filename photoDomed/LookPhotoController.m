//
//  LookPhotoController.m
//  photoDomed
//
//  Created by SHICHUAN on 2016/11/29.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "LookPhotoController.h"

@interface LookPhotoController ()

@end

@implementation LookPhotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    NSData *data = [NSData dataWithContentsOfFile:[self getImagePath]];
    UIImage *imageLocal = [UIImage imageWithData:data];
    imageView.image = imageLocal;
    
    [self.view addSubview:imageView];
    
}


-(NSString *)getImagePath
{
    
    
    NSString *_tmpPath;
    
    if (_tmpPath == nil) {
        NSArray *array = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = array.firstObject;
        _tmpPath = [path stringByAppendingPathComponent:@"photo"];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:_tmpPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:_tmpPath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        _tmpPath = [_tmpPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",@"IMG_0007"]];
        
    }
    return _tmpPath;
    
}


@end
