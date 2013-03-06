//
//  GifCell.m
//  UIImageViewGIF
//
//  Created by sagles on 13-2-28.
//
//

#import "GifCell.h"
#import "UIImageView+imageViewWithGIF.h"

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

- (void)prepareForReuse
{
    _gifImageView.image = nil;
    [_gifImageView stopAnimating];
    [_gifImageView setAnimationImages:nil];
}

- (void)setGifImageWithRow:(NSUInteger)row
{
    NSData *gifData = nil;
    @autoreleasepool {
        if (row%2 == 1) {
            gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
                                                      pathForResource:@"bbb"
                                                      ofType:@"gif"]];
        }else{
            gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
                                                      pathForResource:@"demo"
                                                      ofType:@"gif"]];
        }
        
        [_gifImageView startAnimationWithImageData:gifData];
    }
}

@end
