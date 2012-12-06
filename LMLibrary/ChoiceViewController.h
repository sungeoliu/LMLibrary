//
//  ChoiceViewController.h
//  Date
//
//  Created by Liu Wanwei on 12-12-4.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MultiChoice,
    SingleChoice
}ChoiceType;

@class ChoiceViewController;

@protocol ChoiceViewDelegate <NSObject>
-(void)choiceViewController:(ChoiceViewController *)choiceViewController gotChoice:(NSArray *)choices;
@end


@interface ChoiceViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) ChoiceType type;
@property (nonatomic) BOOL autoDisappear;
@property (nonatomic, strong) NSString * userTitle;
@property (nonatomic, strong) NSArray * choices;
@property (nonatomic, strong) NSArray * currentChoices;
@property (nonatomic, strong) id<ChoiceViewDelegate> delegate;

@end
