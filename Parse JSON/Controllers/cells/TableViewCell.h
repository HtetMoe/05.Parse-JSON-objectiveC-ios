//
//  TableViewCell.h
//  Parse JSON
//
//  Created by Htet Moe Phyu on 15/11/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *searialNumber;
@property (weak, nonatomic) IBOutlet UILabel *courseName;

@end

NS_ASSUME_NONNULL_END
