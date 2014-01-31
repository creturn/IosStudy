//
//  main.m
//  StudyObject_c
//
//  Created by 吕腾飞 on 14-1-30.
//  Copyright (c) 2014年 吕腾飞. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSLog(@"Hello, World!");
        
        //array test
        NSArray *data1 = [[NSArray alloc] initWithObjects:@"123321321",@"jfjjfdsa",@"creturn",nil];
        for (int i = 0; i < data1.count; i++) {
            NSLog(@"%@", [data1 objectAtIndex:i]);
        }
        
        NSString *names = @"creturn, flyer, wufei, shanghai, beijing, duolunduo";
        NSArray *nameArr = [names componentsSeparatedByString:@","]; //根据字符分割字符串
        for (int i = 0; i < nameArr.count; i++) {
            NSLog(@"name:%@", [nameArr objectAtIndex:i]);
        }
        //MutableArray
        NSMutableArray *muArray = [[NSMutableArray alloc] initWithObjects:@"creturn",@"flyer", nil];
        for (int i = 0; i < muArray.count; i++) {
            NSLog(@"Mu init name:%@", [muArray objectAtIndex:i]);
        }
        
        [muArray addObject:@"feifei"];
        [muArray addObject:@"love"];
        [muArray addObject:data1];
        
        for (int i = 0; i < muArray.count; i++) {
            NSLog(@"Mu added name:%@", [muArray objectAtIndex:i]);
        }
        
        // dictionary test
        NSDictionary *persionDic = [NSDictionary dictionaryWithObjectsAndKeys:@"creturn",@"name",@"boy",@"sex", nil];
        NSLog(@"dic: %@", persionDic);
        //foreach the dic
        for (id key in  persionDic) {
            NSLog(@"Key: %@ Value: %@", key , [persionDic objectForKey:key]);
        }
        
        //MuTableDictionary
        
        NSMutableDictionary *book = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"绝世唐门",@"name", nil];
        //foreach the mutable dic
        for (id key in  book) {
            NSLog(@"Key: %@ Value: %@", key , [book objectForKey:key]);
        }
        [book setObject:@"这个是书本的简介内容" forKey:@"desc"];
        [book setObject:@"http://www.book.com/1" forKey:@"site"];
        for (id key in  book) {
            NSLog(@"Key: %@ Value: %@", key , [book objectForKey:key]);
        }
        // foreach the all book value
        for (id val in [book allValues]) {
            NSLog(@"value: %@", val);
        }
        //format somthing value
        NSLog(@"format a string with int: %d", [@"12ab" intValue]);
        NSLog(@"format a int value with string:%@", [@(1211) stringValue]);
        
    }
    return 0;
}

