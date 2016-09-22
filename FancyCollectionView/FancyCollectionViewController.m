//
//  FancyCollectionViewController.m
//  FancyCollectionView
//
//  Created by Jeremy Petter on 2016-09-22.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

#import "FancyCollectionViewController.h"
#import "FancyCell.h"

@interface FancyCollectionViewController ()

@property (nonatomic, assign) int numberOfItems;

@end

@implementation FancyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberOfItems = 3;
    self.collectionView.allowsMultipleSelection = YES;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numberOfItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    FancyCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"RedCell" forIndexPath:indexPath];

    [cell setup];

    return cell;
}

#pragma - UICollectionViewDelegate

//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.item % 2 == 0)
//    {
//        return YES;
//    }
//    return NO;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self removeItem:indexPath];
}

#pragma mark - UICollectionViewDelegateFlowLayout

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    return CGSizeMake(30.0, 100.0);
//}
//
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//
//    return UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0);
//}

#pragma mark - Actions

- (IBAction)addButtonPushed:(UIBarButtonItem *)sender {
    [self addItem];
}

#pragma mark - Helper Methods

- (void)addItem {
    self.numberOfItems += 1;

    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.numberOfItems - 1 inSection:0];

    [self.collectionView performBatchUpdates:^{
        [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
         } completion:nil];
    //[self.collectionView reloadData];
}

- (void)removeItem:(NSIndexPath *)indexPath {

    self.numberOfItems -= 1;
    [self.collectionView performBatchUpdates:^{
        [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:nil];
    // [self.collectionView reloadData];
}

@end
