//
//  Operators.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 06/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "Operators.h"

@implementation Operators

+ (void)operators {
//    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
//    NSData *inputData = [kbd readDataToEndOfFile];
//    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *inputComponents = @[@"12.00", @"20", @"8"]; //[inputString componentsSeparatedByString:@"\n"];

    double mealCost = [[inputComponents firstObject] doubleValue];
    int tipPercent = [inputComponents[1] intValue];
    int taxPercent = [[inputComponents lastObject] intValue];

    double tip = mealCost * (tipPercent / 100.0);
    double tax = mealCost * (taxPercent / 100.0);

    double totalMealCost = mealCost + tip + tax;

    printf("The total meal cost is %.0f dollars.", totalMealCost);
}

@end
