//
//  UARequestModel.h
//  UniqueArchitecture
//
//  Created by summer on 15/5/11.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum HOST_URL_TYPE{
    HOST_URL_DEFAULT = 0
}HOST_URL_TYPE;

@interface UARequestModel : NSObject

@property(nonatomic,retain) NSMutableDictionary *params;
@property(nonatomic,assign) HOST_URL_TYPE       serverUrl;

@end
