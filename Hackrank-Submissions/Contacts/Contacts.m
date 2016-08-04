//
//  Contacts.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 04/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "Contacts.h"

@interface Trie : NSObject

@property(nonatomic, strong) NSMutableDictionary *children;
@property(nonatomic, assign) NSInteger number;

@end

@implementation Trie

- (instancetype)init {
    self = [super init];

    if (!self) {
        return nil;
    }

    _children = [NSMutableDictionary new];
    _number = 0;

    return self;
}

- (void)insertWord:(NSString *)word {
    Trie *node = self;

    for (NSInteger i = 0; i < word.length; i++) {
        NSNumber *charNumber = @([word characterAtIndex:i]);
        if (!node.children[charNumber]) {
            node.children[charNumber] = [Trie new];
        }

        node.number++;

        node = node.children[charNumber];
    }

    node.number++;
}

- (NSInteger)findOccurencesOfWord:(NSString *)word {
    Trie *node = self;

    for (NSInteger i = 0; i < word.length; i++) {
        NSNumber *charNumber = @([word characterAtIndex:i]);

        if (!node.children[charNumber]) {
            return 0;
        }

        node = node.children[charNumber];
    }

    return node.number;
}

@end

@implementation Contacts

static NSString *AddPrefix = @"add ";
static NSString *FindPrefix = @"find ";

+ (void)contacts {
//    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
//    NSData *inputData = [kbd readDataToEndOfFile];
//    NSString *inputString = [[NSString alloc] initWithData:inputData
//                                                  encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *input = @[@"4", @"add hack", @"add hackerrank", @"find hac", @"find hak"]; //[inputString componentsSeparatedByString:@"\n"];
    NSArray<NSString *> *operationsArray = [input subarrayWithRange:NSMakeRange(1, input.count - 1)];
    Trie *trie = [Trie new];

    for (NSString *operation in operationsArray) {
        NSString *name = [operation componentsSeparatedByString:@" "].lastObject;

        if ([operation containsString:AddPrefix]) {
            [trie insertWord:name];
        } else if ([operation containsString:FindPrefix]) {
            printf("%zd\n", [trie findOccurencesOfWord:name]);
        }
    }
}

@end
