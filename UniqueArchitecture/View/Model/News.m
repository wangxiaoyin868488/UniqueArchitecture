//
//  News.m
//  UniqueArchitecture
//
//  Created by summer on 15/5/14.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "News.h"

@implementation News

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{@"city" : @"city",
             @"cityId" : @"cityid",
             @"time" : @"time",
             @"njd" : @"njd",
             @"tem" : @"tem",
             @"qy" : @"qy"
             };
}


//+ (NSValueTransformer *)qyJSONTransformer {
//    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:NSNumber.Class];
//}

+ (NSValueTransformer *)qyJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}


+ (NSValueTransformer *)cityId1JSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [NSNumber numberWithInt:[str intValue]];
    } reverseBlock:^(NSNumber *cityId) {
        return cityId;
    }];
}


+ (NSValueTransformer *)temJSONTransformer {
    return [MTLValueTransformer transformerWithBlock:^(NSString *str){
        return [NSNumber numberWithInt:[str intValue]];
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    
    if (self){
    
    }
    return self;
}

@end
