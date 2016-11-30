//
//  ViewController.m
//  photoDomed
//
//  Created by SHICHUAN on 2016/11/29.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "ViewController.h"
#import "GrabCollectionViewCell.h"
#import "LookPhotoController.h"
#import "GrabModel.h"
#import "Thumbnail.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

{
    NSString *_photoPath;
}


@property(nonatomic,strong)UICollectionView *collectionView;
- (IBAction)lookPhoto:(UIBarButtonItem *)sender;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)UIImageView *thumbnailView;
@property(nonatomic,strong)Thumbnail *thumbnail;
@end

static NSString *HistoryCollectionViewCell = @"HistoryCollectionViewCell";

@implementation ViewController

#pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        
        //注册collectionView的cell的类型
        [_collectionView registerNib:[UINib nibWithNibName:@"GrabCollectionViewCell" bundle:nil]    forCellWithReuseIdentifier:HistoryCollectionViewCell];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

-(NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
-(Thumbnail *)thumbnail
{
    if (_thumbnail == nil) {
        _thumbnail = [[Thumbnail alloc] init];
    }
    return _thumbnail;
}
-(UIImageView *)thumbnailView//缩略图大小
{
    if (_thumbnailView == nil) {
        _thumbnailView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 112)];
    }
    return _thumbnailView;
}




- (IBAction)lookPhoto:(UIBarButtonItem *)sender {//模拟网络加载

    
    _photoPath =  [self  getImagePath];
    
    UIImage *originalImage = [UIImage imageNamed:@"IMG_0007"];
    UIImage *thumbnailImage = [self getThumbnail:originalImage];//缩略图
   
    NSData *data  = UIImageJPEGRepresentation(originalImage, 1.0);
    [data writeToFile:_photoPath atomically:NO];//原始照片
    
    
    
    
   
    NSDictionary *dict = @{@"grabPath":_photoPath,//路径获取原始照片
                           @"thumbnail":thumbnailImage//缩略图
                           };
    GrabModel *model = [GrabModel GrabModelDictionary:dict];//model  如果要本地化，就归档
    [self.array addObject:model];
    
    
    
    
    
    
    [self.collectionView reloadData];
    
   

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




//自定义缩略图
-(UIImage*)getThumbnail:(UIImage*)onImage
{
    
    self.thumbnailView.image = onImage;
    UIImage *thumbnailImage  = [self.thumbnail  imageWithCaptureView:self.thumbnailView];
    return thumbnailImage;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.collectionView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return self.array.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GrabCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:HistoryCollectionViewCell forIndexPath:indexPath];
    GrabModel *model = self.array[indexPath.item];
    item.grabModel = model;
    return item;
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    LookPhotoController *lookPhoto = [[LookPhotoController alloc] init];
    lookPhoto.modelArray = self.array;
    [self.navigationController pushViewController:lookPhoto animated:YES];
    
}








#pragma mark -UICollectionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([UIScreen mainScreen].bounds.size.width >= 540) {
        
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/5-2,[UIScreen mainScreen].bounds.size.width/5-2);
    }else{
        
        return CGSizeMake([UIScreen mainScreen].bounds.size.width/4-2,[UIScreen mainScreen].bounds.size.width/4-2);
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

@end
