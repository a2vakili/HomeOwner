//
//  ViewController.m
//  HomeOwner
//
//  Created by Arsalan Vakili on 2015-10-22.
//  Copyright © 2015 Arsalan Vakili. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItem.h"
#import "BNRItemStore.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController


-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i< 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if (self) {
        for (int i = 0; i< 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"lol"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[BNRItemStore sharedStore]allItems]count] + 1;
    
    // the plus one is for having last row says says No more Items !
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"lol" forIndexPath:indexPath];
    
    NSArray *items = [[BNRItemStore sharedStore]allItems];
   
    
    // this is for doing the silver exercise
    NSMutableArray *moreItems = [[NSMutableArray alloc]initWithArray:items];
    [moreItems addObject:@"No More Items"];
    
    NSArray *itemArray = [moreItems copy];
    
    BNRItem *item = itemArray[indexPath.row];
    cell.textLabel.text = [item description];
    
    return cell;
}

@end
