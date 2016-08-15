//
//  BinaryNumbers.m
//  Hackrank-Submissions
//
//  Created by Edgar Antunes on 15/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "BinaryNumbers.h"

@interface StackHelper : NSObject

@property (nonatomic, assign, readonly) BOOL isEmpty;

- (void)push:(id)object;

- (id)pop;

@end

@interface StackHelper ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation StackHelper

- (instancetype)init {
    self = [super init];

    if (!self) {
        return nil;
    }

    _array = [NSMutableArray new];

    return self;
}

- (void)push:(id)object {
    if (!object) {
        return;
    }

    [self.array addObject:object];
}

- (id)pop {
    if (self.isEmpty) {
        return nil;
    }

    NSInteger lastIndex = (self.array.count - 1);
    id object = [self.array objectAtIndex:lastIndex];
    [self.array removeObjectAtIndex:lastIndex];

    return object;
}

- (BOOL)isEmpty {
    return self.array.count == 0;
}

@end

@implementation BinaryNumbers

+ (void)binaryNumbers
{
    //    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
    //    NSData *inputData = [kbd readDataToEndOfFile];
    //    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSInteger number = 13; // inputString.integerValue
    StackHelper *stack = [StackHelper new];

    do {
        [stack push:@(number & 1)];

        number = (number >> 1);
    } while (number > 0);

    NSInteger maximumNumberOfOnes = 0;
    NSInteger currentMaximumNumberOfOnes = 0;
    while (!stack.isEmpty) {
        NSInteger value = [[stack pop] integerValue];

        if (value == 1) {
            currentMaximumNumberOfOnes += 1;

            if (currentMaximumNumberOfOnes > maximumNumberOfOnes) {
                maximumNumberOfOnes = currentMaximumNumberOfOnes;
            }
        } else {
            currentMaximumNumberOfOnes = 0;
        }
    }

    printf("%zd\n", maximumNumberOfOnes);
}

@end
