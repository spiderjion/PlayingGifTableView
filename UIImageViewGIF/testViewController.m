//
//  testViewController.m
//  UIImageViewGIF
//
//  Created by khan.lau on 13-2-26.
//
//

#import "testViewController.h"
#import "UIImageView+imageViewWithGIF.h"

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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
- (void)reStartAnimating{
    NSArray *vc = [self.tableView visibleCells];
    for (UITableViewCell *cell in vc) {
//        NSLog(@"%d", [cell isSelected]);
//        if ([cell isSelected] == NO) {
//            continue;
//        }
        for (UIView *v in [cell.contentView subviews]) {
            if ([v isKindOfClass:[UIImageView class]]){
                UIImageView * imageview = (UIImageView *)v;
                if ([imageview isAnimating] == NO) {
                    [imageview startAnimating];
                }
            }
        }
    }
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
    static NSString *cellIdentifier2 = @"Cell2";
    UITableViewCell *cell = nil;
    if (indexPath.row % 2 == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
                                                              pathForResource:@"bbb"
                                                              ofType:@"gif"]];
            UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
            imageView.frame = CGRectMake(0, 0, 100, 100);
            imageView.tag = 100;
            [cell.contentView addSubview:imageView];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
                                                              pathForResource:@"demo"
                                                              ofType:@"gif"]];
            UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
            imageView.frame = CGRectMake(0, 0, 100, 100);
            imageView.tag = 100;
            [cell.contentView addSubview:imageView];
        }
    }

//    for (UIView *v in [cell.contentView subviews]) {
//        if ([v isKindOfClass:[UIView class]]){
//            [v removeFromSuperview];
//        }
//    }
//    if ([indexPath row] == 0) {
////        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
////                                                          pathForResource:@"demo"
////                                                          ofType:@"gif"]];
//        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.image = [UIImage imageNamed:@"IMG_0015.jpg"];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 1){
//        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
//                                                          pathForResource:@"bbb"
//                                                          ofType:@"gif"]];
//        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 2){
////        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
////                                                          pathForResource:@"demo"
////                                                          ofType:@"gif"]];
////        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
////        imageView.frame = CGRectMake(0, 0, 100, 100);
////        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 3){
//        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
//                                                          pathForResource:@"bbb"
//                                                          ofType:@"gif"]];
//        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 4){
////        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
////                                                          pathForResource:@"demo"
////                                                          ofType:@"gif"]];
////        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
////        imageView.frame = CGRectMake(0, 0, 100, 100);
////        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 5){
//        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
//                                                          pathForResource:@"bbb"
//                                                          ofType:@"gif"]];
//        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 6){
////        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
////                                                          pathForResource:@"demo"
////                                                          ofType:@"gif"]];
////        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
////        imageView.frame = CGRectMake(0, 0, 100, 100);
////        [cell.contentView addSubview:imageView];
//    }else if ( [indexPath row] == 7){
//        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
//                                                          pathForResource:@"bbb"
//                                                          ofType:@"gif"]];
//        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }else{
//        NSData *gifData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]
//                                                          pathForResource:@"bbb"
//                                                          ofType:@"gif"]];
//        UIImageView *imageView = [UIImageView imageViewWithGIFData:gifData];
//        imageView.frame = CGRectMake(0, 0, 100, 100);
//        [cell.contentView addSubview:imageView];
//    }
    

//    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.3f];
    return cell;
}
//行高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([indexPath section]==0) {
        return 115;
    } else
        return 50;
}

//判断选中的行
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self reStartAnimating];
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    NSArray *arr = [NSArray arrayWithObject:NSRunLoopCommonModes];
    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f inModes:arr];
}


- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self reStartAnimating];
    return indexPath;
}
// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self performSelector:@selector(reStartAnimating) withObject:nil afterDelay:0.1f];
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
