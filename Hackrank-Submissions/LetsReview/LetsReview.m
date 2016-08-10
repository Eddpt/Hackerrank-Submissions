
//
//  LetsReview.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 10/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "LetsReview.h"

@implementation LetsReview

+ (void)letsReview
{
//    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
//    NSData *inputData = [kbd readDataToEndOfFile];
//    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *inputComponents = @[@"2", @"Hacker", @"Rank"]; //[inputString componentsSeparatedByString:@"\n"];

    NSInteger nTestCases = [[inputComponents firstObject] integerValue];

    for (NSInteger i = 0; i < nTestCases; i++) {
        NSString *currentString = inputComponents[i + 1];
        NSMutableString *evenString = [NSMutableString new];
        NSMutableString *oddString = [NSMutableString new];

        for (NSInteger j = 0; j < currentString.length; j++) {
            unichar currentCharacter = [currentString characterAtIndex:j];

            NSMutableString *evenOrOddString = (j % 2 == 0) ? evenString : oddString;

            [evenOrOddString appendString:[NSString stringWithFormat:@"%c", currentCharacter]];
        }

        printf("%s %s\n", [evenString UTF8String], [oddString UTF8String]);
    }
}

@end
