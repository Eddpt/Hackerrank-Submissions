//
//  Anagram.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 05/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "Anagram.h"

@implementation Anagram

+ (void)anagram {
//    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
//    NSData *inputData = [kbd readDataToEndOfFile];
//    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *input = @[@"6", @"aaabbb", @"ab", @"abc", @"mnop", @"xyyx", @"xaxbbbxx"]; //[inputString componentsSeparatedByString:@"\n"];
    input = [input subarrayWithRange:NSMakeRange(1, [input count] - 1)];

    for (NSString *string in input) {
        NSInteger stringLength = [string length];
        if (stringLength % 2 == 1) {
            printf("-1\n");
            continue;
        }

        NSInteger halfStringLength = stringLength / 2;
        NSString *s1 = [string substringWithRange:NSMakeRange(0, halfStringLength)];
        NSString *s2 = [string substringWithRange:NSMakeRange(halfStringLength, halfStringLength)];
        NSMutableDictionary *charactersCount = [NSMutableDictionary new];
        NSNumber *currentChar;

        for (NSInteger i = 0; i < [s1 length]; i++) {
            currentChar = @([s1 characterAtIndex:i]);
            charactersCount[currentChar] = @(([charactersCount[currentChar] integerValue] ?: 0) + 1);
        }

        for (NSInteger i = 0; i < [s2 length]; i++) {
            currentChar = @([s2 characterAtIndex:i]);
            charactersCount[currentChar] = @(([charactersCount[currentChar] integerValue] ?: 0) - 1);
        }

        NSInteger numberOfChangesNeeded = 0;
        for (NSNumber *key in [charactersCount allKeys]) {
            numberOfChangesNeeded += ABS([charactersCount[key] integerValue]);
        }

        printf("%zd\n", numberOfChangesNeeded / 2);
    }
}

@end