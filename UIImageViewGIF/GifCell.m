//
//  GifCell.m
//  UIImageViewGIF
//
//  Created by sagles on 13-2-28.
//
//

#import "GifCell.h"

@implementation GifCell

- (void)dealloc {
    [_gifImageView release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setGifImageWithRow:(NSUInteger)row
{
    
}

@end
