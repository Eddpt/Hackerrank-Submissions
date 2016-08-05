//
//  MinimumDistances.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 05/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "MinimumDistances.h"

@implementation MinimumDistances

+ (void)minimumDistances {
//    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
//    NSData *inputData = [kbd readDataToEndOfFile];
//    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *input = @[@"6", @"7 1 3 4 1 7"]; //[inputString componentsSeparatedByString:@"\n"];
    input = [[input lastObject] componentsSeparatedByString:@" "];

    NSMutableArray<NSNumber *> *inputNumbers = [NSMutableArray new];
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];

    for(NSString *string in input) {
        [inputNumbers addObject:[numberFormatter numberFromString:string]];
    }

    NSMutableDictionary<NSNumber *, NSNumber *> *numbersDictionary = [NSMutableDictionary new];
    NSNumber *currentNumber;
    NSNumber *lastIndex;
    NSInteger minDistance = -1;

    for (NSInteger index = 0; index < [inputNumbers count]; index++) {
        currentNumber = inputNumbers[index];
        lastIndex = numbersDictionary[currentNumber];

        if (lastIndex) {
            NSInteger currentDistance = index - [lastIndex integerValue];
            if (minDistance == -1 || currentDistance < minDistance) {
                minDistance = currentDistance;
            }

            if (minDistance == 1) {
                printf("1\n");
                return;
            }
        }

        numbersDictionary[currentNumber] = @(index);
    }

    printf("%zd\n", minDistance);
}
@end
