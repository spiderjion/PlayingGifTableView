//
//  testViewController.m
//  UIImageViewGIF
//
//  Created by khan.lau on 13-2-26.
//
//

#import "testViewController.h"
#import "GifCell.h"

@interface testViewController ()

@end

@implementation testViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *exitBtn = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(doExit:)]  ;
    self.navigationItem.leftBarButtonItem = exitBtn;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)reStartAnimating{
    NSArray *vc = [self.tableView visibleCells];
//    for (UITableViewCell *cell in vc) {
//        for (UIView *v in [cell.contentView subviews]) {
//            if ([v isKindOfClass:[UIImageView class]]){
//                UIImageView * imageview = (UIImageView *)v;
//                if ([imageview isAnimating] == NO) {
//                    [imageview startAnimating];
//                }
//            }
//        }
//    }
    
    [vc enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       if ([obj isKindOfClass:[UITableViewCell class]])
       {
           UITableViewCell *cell = (UITableViewCell *)obj;
           [cell.contentView.subviews enumerateObjectsUsingBlock:^(id subV, NSUInteger index, BOOL *stop) {
               if ([subV isKindOfClass:[UIImageView class]])
               {
                   UIImageView *imageView = (UIImageView *)subV;
                   if (![imageView isAnimating]) [imageView startAnimating];
               }
           }];
       }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)doExit:(id)sender{
    [self.parentViewController dismissViewControllerAnimated:YES completion:^{}];
    //    [self.parentViewController dismissModalViewControllerAnimated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    GifCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GifCell" owner:self options:nil] lastObject];
    }
    
    [cell setGifImageWithRow:indexPath.row];

    return cell;
}
//行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath section]==0) {
        return 115;
    } else
        return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [NSArray arrayWithObject:NSRunLoopCommonModes];
    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f inModes:arr];
}

// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = [NSArray arrayWithObject:NSRunLoopCommonModes];
    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f inModes:arr];
}

//cell显示的时候重新开启动画
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = [NSArray arrayWithObject:NSRunLoopCommonModes];
    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f inModes:arr];
}

@end
