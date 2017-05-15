//
//  NSDictionary+NullReplacement.h
//  BLEDemo
//
//  Created by MASUD RANA on 1/19/16.
//  Copyright © 2016 MASUD RANA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NullReplacement)

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks;
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;

@end
