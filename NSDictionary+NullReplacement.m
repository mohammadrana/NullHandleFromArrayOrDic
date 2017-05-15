//
//  NSDictionary+NullReplacement.m
//  BLEDemo
//
//  Created by MASUD RANA on 1/19/16.
//  Copyright © 2016 MASUD RANA. All rights reserved.
//

#import "NSDictionary+NullReplacement.h"
#import "NSArray+NullReplacement.h"

@implementation NSDictionary (NullReplacement)


- (NSDictionary *)dictionaryByReplacingNullsWithBlanks {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for (NSString *key in self) {
        id object = [self objectForKey:key];
        if (object == nul) [replaced setObject:blank forKey:key];
        else if ([object isKindOfClass:[NSDictionary class]]) [replaced setObject:[object dictionaryByReplacingNullsWithBlanks] forKey:key];
        else if ([object isKindOfClass:[NSArray class]]) [replaced setObject:[object arrayByReplacingNullsWithBlanks] forKey:key];
    }
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

/////
- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    
    for(NSString *key in self) {
        const id object = [self objectForKey:key];
        if(object == nul) {
            //pointer comparison is way faster than -isKindOfClass:
            //since [NSNull null] is a singleton, they'll all point to the same
            //location in memory.
            [replaced setObject:blank
                         forKey:key];
        }
    }
    
    return [replaced copy];
}
/////


@end
