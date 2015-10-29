//
//  BNRItemStore.m
//  HomeOwner
//
//  Created by Arsalan Vakili on 2015-10-22.
//  Copyright © 2015 Arsalan Vakili. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property(nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore

+(instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    
    // do i need to create a sharedstore
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// if the programmer calls [[BNRItemStore alloc]init] , we want to now about the error.
-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedStore]" userInfo:nil];
}

// the real secret intializer

-(instancetype)initPrivate{
    self = [super init];
    
    if (self) {
        _privateItems = [NSMutableArray new];
    }
    return self;
}

-(NSArray *)allItems{
    return self.privateItems;
}

-(BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    
    return item;
}

@end
