//
//  GifCell.h
//  UIImageViewGIF
//
//  Created by sagles on 13-2-28.
//
//

#import <UIKit/UIKit.h>

@interface GifCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *gifImageView;


/*!
 @brief     <#abstract#>
 @param     <#param#> <#param description#>
 @return    <#return#>
 */
- (void)setGifImageWithRow:(NSUInteger)row;

@end
