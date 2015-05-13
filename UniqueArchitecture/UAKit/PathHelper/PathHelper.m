//
//  PathHelper.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/13.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "PathHelper.h"

@implementation PathHelper

+ (NSString *)pathForDocumentDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
        return [paths objectAtIndex:0];
    }
    return nil;
}

@end
