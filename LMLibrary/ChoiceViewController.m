//
//  ChoiceViewController.m
//  Date
//
//  Created by Liu Wanwei on 12-12-4.
//  Copyright (c) 2012年 Liu&Mao. All rights reserved.
//

#import "ChoiceViewController.h"

@interface ChoiceViewController (){
    int _lastSelectedIndex;
}

@end

@implementation ChoiceViewController

@synthesize type = _type;
@synthesize autoDisappear = _autoDisappear;
@synthesize userTitle = _userTitle;
@synthesize choices = _choices;
@synthesize currentChoices = _currentChoices;
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _lastSelectedIndex = -1;
        _type = SingleChoice;
        _autoDisappear = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setTitle:self.userTitle == nil ? @"请选择" : self.userTitle];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.delegate != nil) {
        NSArray * result = [self parseSelection];
        [self.delegate performSelector:@selector(choiceViewController: gotChoice:) withObject:self withObject:result];
    }
}

- (NSArray *)parseSelection{
    NSMutableArray * result = nil;
    for (int i = 0; i < self.choices.count; i++) {
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPath];
        if ([self didSelectCell:cell]) {
            if (result == nil) {
                result = [[NSMutableArray alloc] init];
            }
            
            [result addObject:[self.choices objectAtIndex:i]];
        }
    }
    
    return result;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.choices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell...
    NSString * text = [self.choices objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    [self unselectCell:cell];
    for (NSString * string in self.currentChoices) {
        if ([string isEqualToString:text]) {
            [self selecteCell:cell];
            
            if (self.type == SingleChoice) {
                _lastSelectedIndex = indexPath.row;
            }
            break;
        }
    }
    
    return cell;
}

- (void)selecteCell:(UITableViewCell *)cell{
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)unselectCell:(UITableViewCell *)cell{
    cell.accessoryType = UITableViewCellAccessoryNone;
}

- (BOOL)didSelectCell:(UITableViewCell *)cell{
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        return YES;
    }else{
        return NO;
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell;
    int index = indexPath.row;
    if (self.type == SingleChoice) {
        cell = [tableView cellForRowAtIndexPath:indexPath];
        if (index == _lastSelectedIndex) {
            [self unselectCell:cell];
        }else{
            [self selecteCell:cell];
            
            if (_lastSelectedIndex != -1) {
                cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_lastSelectedIndex inSection:indexPath.section]];
                [self unselectCell:cell];
            }
        }
        
        if (self.autoDisappear && self.navigationController != nil) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }else if(self.type == MultiChoice){
        cell = [tableView cellForRowAtIndexPath:indexPath];
        if ([self didSelectCell:cell]) {
            [self unselectCell:cell];
        }else{
            [self selecteCell:cell];
        }
    }
}

@end
