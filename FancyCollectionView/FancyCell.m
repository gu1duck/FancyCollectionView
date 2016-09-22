//
//  FancyCell.m
//  FancyCollectionView
//
//  Created by Jeremy Petter on 2016-09-22.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

#import "FancyCell.h"

@implementation FancyCell

- (void)setup {
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
}
@end
