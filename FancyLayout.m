//
//  FancyLayout.m
//  FancyCollectionView
//
//  Created by Jeremy Petter on 2016-09-22.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

#import "FancyLayout.h"

@interface FancyLayout ()

@property (nonatomic, strong) NSArray *savedLayoutAttributes;

@end

CGFloat const cellWidth = 100.0;
CGFloat const cellHeight = 100.0;
CGFloat const vPadding = 10.0;
CGFloat const hPadding = 10.0;

@implementation FancyLayout

- (CGSize)collectionViewContentSize {
    return CGSizeMake((cellWidth + hPadding) * 3.0, (cellHeight + vPadding) * [self.collectionView numberOfItemsInSection:0]);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSMutableArray *tempArray = [[NSMutableArray alloc] init];

    for (UICollectionViewLayoutAttributes *attributes in self.savedLayoutAttributes) {

        if (CGRectIntersectsRect(rect, attributes.frame) == YES) {
            [tempArray addObject:attributes];
        }
    }
    return tempArray;
}

- (void)prepareLayout {

    NSMutableArray *tempArray = [[NSMutableArray alloc] init];

    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

        CGRect cellFrame = CGRectMake((cellWidth + hPadding) * (indexPath.item % 3), (cellHeight + vPadding) * indexPath.item, cellWidth, cellHeight);

        attributes.frame = cellFrame;

        [tempArray addObject:attributes];
    }

    self.savedLayoutAttributes = tempArray;
}

@end
