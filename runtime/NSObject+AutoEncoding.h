//
//  NSObject+AutoEncoding.h
//  runtime
//
//  Created by 张天琦 on 15/12/18.
//  Copyright © 2015年 张天琦. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (AutoEncoding)<NSCoding>

-(instancetype)initWithCoder:(NSCoder *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;

@end
