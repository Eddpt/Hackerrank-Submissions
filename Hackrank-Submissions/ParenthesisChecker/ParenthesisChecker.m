//
//  ParenthesisChecker.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 08/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "ParenthesisChecker.h"

@interface Stack : NSObject

@property (nonatomic, assign, readonly) BOOL isEmpty;

- (void)pushObject:(id)object;

- (id)popObject;

- (id)peek;

@end

@interface Stack ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Stack

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }

    _array = [NSMutableArray new];

    return self;
}

- (void)pushObject:(id)object
{
    if (!object) {
        return;
    }

    [self.array addObject:object];
}

- (id)popObject
{
    if (self.isEmpty) {
        return nil;
    }

    id object = self.array.lastObject;
    [self.array removeObjectAtIndex:self.array.count - 1];

    return object;
}

- (id)peek
{
    return self.array.lastObject;
}

- (BOOL)isEmpty
{
    return self.array.count == 0;
}

@end

static unichar const CurlyBracketOpening = '{';
static unichar const CurlyBracketClosing = '}';

static unichar const SquareBracketOpening = '[';
static unichar const SquareBracketClosing = ']';

static unichar const SimpleBracketOpening = '(';
static unichar const SimpleBracketClosing = ')';

@implementation ParenthesisChecker

+ (void)parenthesisChecker
{
    Stack *stack = [Stack new];

    NSString *input = @"{[[cxvxcv]]sfs}ss*";

    for (NSInteger i = 0; i < input.length; i++) {
        unichar currentChar = [input characterAtIndex:i];
        if (![self isParenthesisCharacter:currentChar]) {
            continue;
        }

        if ([self isOpeningParenthesisCharacter:currentChar]) {
            [stack pushObject:@(currentChar)];
            continue;
        }

        unichar lastParenthesis = [[stack peek] unsignedCharValue];

        if ([self isCharacter:currentChar closingCharacterFor:lastParenthesis]) {
            [stack popObject];
        } else {
            break;
        }
    }

    printf("The given input %s the correct usage of paranthesis\n", [((stack.isEmpty) ? @"has" : @"does not have") UTF8String]);
}

+ (BOOL)isParenthesisCharacter:(unichar)character
{
    return [self isOpeningParenthesisCharacter:character] || [self isClosingParenthesisCharacter:character];
}

+ (BOOL)isOpeningParenthesisCharacter:(unichar)character
{
    NSString *openingParenthesis = [NSString stringWithFormat:@"%c%c%c", CurlyBracketOpening, SquareBracketOpening, SimpleBracketOpening];
    return [openingParenthesis containsString:[NSString stringWithFormat:@"%c", character]];
}

+ (BOOL)isClosingParenthesisCharacter:(unichar)character
{
    NSString *closingParenthesis = [NSString stringWithFormat:@"%c%c%c", CurlyBracketClosing, SquareBracketClosing, SimpleBracketClosing];

    return [closingParenthesis containsString:[NSString stringWithFormat:@"%c", character]];
}

+ (BOOL)isCharacter:(unichar)closingParenthesisCandidate closingCharacterFor:(unichar)lastParenthesis
{
    static NSDictionary *parenthesisDictionary;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        parenthesisDictionary = @{ @(CurlyBracketOpening): @(CurlyBracketClosing),
                                   @(SquareBracketOpening): @(SquareBracketClosing),
                                   @(SimpleBracketOpening): @(SimpleBracketClosing), };
    });

    return [parenthesisDictionary[@(lastParenthesis)] unsignedCharValue] == closingParenthesisCandidate;
}

@end
