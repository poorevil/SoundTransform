//
//  TablViewCellFactory.m
//  SoundTransform
//
//  Created by hanchao on 13-11-25.
//  Copyright (c) 2013年 hanchao. All rights reserved.
//

#import "TableViewCellFactory.h"
#import "MainTableViewCell.h"

@implementation TableViewCellFactory

+(MainTableViewCell *)getTableViewCellByCellType:(TableViewCellType)tableViewCellType
                                       tableView:(UITableView *)tableView
                                           owner:(id)owner
{
    NSString *identifier = nil;
    
    switch (tableViewCellType) {
        
        case TableViewCellTypeBinary:
        identifier = @"BinaryCell";
        break;
        
        case TableViewCellTypeText:
        identifier = @"TextCell";
        break;
        
        case TableViewCellTypePhoto:
        identifier = @"PhotoCell";
        break;
        
        case TableViewCellTypeAudio:
        identifier = @"AudioCell";
        break;
        
        case TableViewCellTypeVideo:
        identifier = @"VideoCell";
        break;
        
        default:
        break;
    }
    
    if (identifier) {
        
        MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (!cell) {
            cell = (MainTableViewCell *)[[[NSBundle mainBundle] loadNibNamed:identifier owner:owner options:nil]
                                            objectAtIndex:0];
            cell.delegate = owner;
        }
        
        return cell;
    }
    
    return nil;
    
}

@end
