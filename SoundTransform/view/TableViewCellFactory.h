//
//  TablViewCellFactory.h
//  SoundTransform
//
//  Created by hanchao on 13-11-25.
//  Copyright (c) 2013年 hanchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTableViewCell;

typedef NS_ENUM(NSInteger, TableViewCellType) {
    TableViewCellTypeBinary,        //二进制文件
    TableViewCellTypeText,          //文本文件
    TableViewCellTypePhoto,         //图片
    TableViewCellTypeAudio,         //音频
    TableViewCellTypeVideo          //视频

};

@interface TableViewCellFactory : NSObject

+(MainTableViewCell *)getTableViewCellByCellType:(TableViewCellType)tableViewCellType
                                       tableView:(UITableView *)tableView
                                           owner:(id)owner;

@end
