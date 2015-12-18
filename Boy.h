//
//  Boy.h
//  runtime
//
//  Created by 张天琦 on 15/12/18.
//  Copyright © 2015年 张天琦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Girl;
@interface Boy : NSObject

@property (nonatomic,strong)Girl *girl;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,assign)NSInteger age;


@end
