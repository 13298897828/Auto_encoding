//
//  NSObject+AutoEncoding.m
//  runtime
//
//  Created by 张天琦 on 15/12/18.
//  Copyright © 2015年 张天琦. All rights reserved.
//

#import "NSObject+AutoEncoding.h"
#import <objc/runtime.h>
@implementation NSObject (AutoEncoding)

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
     //记录类中实例变量个数
    
     unsigned int ivarCount = 0;
    
    Ivar *vars = class_copyIvarList(object_getClass(self), &ivarCount);
    

        if (self = [self init]) {
    
            for (int i = 0; i < ivarCount; i ++) {
                
                Ivar var = vars[i];
//                NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
                NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
                [self setValue:[aDecoder decodeObjectForKey:name] forKey:name];
            }
        
        }
    
    free(vars);
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
//    记录中 实例变量的个数
    unsigned int ivarCount = 0;
    Ivar * vars = class_copyIvarList(object_getClass(self), &ivarCount);
    for (int i = 0; i < ivarCount; i ++) {
        Ivar var = vars[i];
//        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(var)];
        NSString *name = [NSString stringWithUTF8String:ivar_getName(var)];
        id value = [self valueForKey:name];
        [aCoder encodeObject:value forKey:name];
    }
    
    free(vars);
    
}

@end
