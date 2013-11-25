//
//  ViewController.m
//  SoundTransform
//
//  Created by hanchao on 13-11-22.
//  Copyright (c) 2013年 hanchao. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "TableViewCellFactory.h"
#import "MSCMoreOptionTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,MSCMoreOptionTableViewCellDelegate>

@property (nonatomic,retain) NSArray *xibArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.xibArray = [NSArray arrayWithObjects:@"BinaryCell",@"TextCell",@"PhotoCell",@"AudioCell",@"VideoCell",nil];
    
    
    self.mTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    [self.mTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//    self.mTableView.separatorColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tableview_sep_line"]];
//    [self.mTableView setAllowsSelection:NO];
    
    [self.view addSubview:self.mTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource<NSObject>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;//TODO:
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Called when "DELETE" button is pushed.
    NSLog(@"DELETE button pushed in row at: %@", indexPath.description);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MainTableViewCell *cell = [TableViewCellFactory getTableViewCellByCellType:TableViewCellTypeText
                                                                     tableView:tableView owner:self];
    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:indentifier owner:self options:nil] objectAtIndex:0];
        //TODO:默认cell
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Delete";
}

////////////////////////////////////////////////////////////////////////
#pragma mark - MSCMoreOptionTableViewCellDelegate
////////////////////////////////////////////////////////////////////////

- (void)tableView:(UITableView *)tableView moreOptionButtonPressedInRowAtIndexPath:(NSIndexPath *)indexPath {
    // Called when "MORE" button is pushed.
    NSLog(@"MORE button pushed in row at: %@", indexPath.description);
}

- (NSString *)tableView:(UITableView *)tableView titleForMoreOptionButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"More";
}

-(UIColor *)tableView:(UITableView *)tableView backgroundColorForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f];
}

@end
