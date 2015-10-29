//
//  BNRItemStore.h
//  HomeOwner
//
//  Created by Arsalan Vakili on 2015-10-22.
//  Copyright © 2015 Arsalan Vakili. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property(nonatomic,readonly) NSArray *allItems;

+(instancetype)sharedStore;

-(BNRItem *)createItem;

@end
