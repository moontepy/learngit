//
//  ViewController.m
//  test
//
//  Created by 金峰 on 16/7/5.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "MyModel.h"
#import "HeaderUICollectionReusableView.h"
#import "CustomUICollectionViewCell.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    CGFloat itemW = self.view.frame.size.width/3;
    CGFloat itemH = itemW;
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    UICollectionView *collectionV  = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionV.backgroundColor = [UIColor whiteColor];
    flowLayout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 80) ;
    collectionV.delegate = self;
    collectionV.dataSource = self;
    
    [self.view addSubview:collectionV];
    
    [collectionV registerClass:[CustomUICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionV registerClass:[HeaderUICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"ConnectPerson.plist" ofType:nil];
        NSArray *tempArr = [NSArray arrayWithContentsOfFile:path];
        _dataArray = [NSMutableArray array];
        
        for (NSDictionary *dic in tempArr) {
            MyModel *model = [[MyModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [_dataArray addObject:model];
        }
    }
    return _dataArray;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.model = self.dataArray[indexPath.row];
    return cell;
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HeaderUICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath] ;
        header.backgroundColor = [UIColor redColor] ;
        return header ;
    }
    else
        return nil ;
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
