//
//  AllAnagrams.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 06/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "AllAnagrams.h"

@interface NSString (Additions)

- (instancetype)sortCharacters;

@end

@implementation NSString (Additions)

- (instancetype)sortCharacters {
    NSInteger numberOfCharacters = self.length;

    if (numberOfCharacters <= 1) {
        return self;
    }

    NSMutableArray *charactersArray = [[NSMutableArray alloc] initWithCapacity:numberOfCharacters];

    for (NSInteger index = 0; index < numberOfCharacters; index++) {
        charactersArray[index] = [NSString stringWithFormat:@"%c", [self characterAtIndex:index]];
    }

    NSArray *sortedCharactersArray = [charactersArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    return [sortedCharactersArray componentsJoinedByString:@""];
}

@end

@implementation AllAnagrams

+ (void)allAnagrams {
    //    NSFileHandle *kbd = [NSFileHandle fileHandleWithStandardInput];
    //    NSData *inputData = [kbd readDataToEndOfFile];
    //    NSString *inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];

    NSArray<NSString *> *input = @[@"pear", @"amleth", @"dormitory", @"tinsel", @"dirty room", @"hamlet", @"listen", @"silnet"]; //[inputString componentsSeparatedByString:@"\n"];
    NSMutableDictionary<NSString *, NSMutableArray *> *anagramsDictionary = [NSMutableDictionary new];
    NSString *sortedCharactersWord;

    for (NSString *word in input) {
        NSString *processedWord = [word.lowercaseString stringByReplacingOccurrencesOfString:@" " withString:@""];
        sortedCharactersWord = [processedWord sortCharacters];
        if (!anagramsDictionary[sortedCharactersWord]) {
            anagramsDictionary[sortedCharactersWord] = [NSMutableArray new];
        }

        [anagramsDictionary[sortedCharactersWord] addObject:word];
    }

    NSMutableArray *anagramsArray = [NSMutableArray new];
    for (NSString *sortedCharWords in anagramsDictionary.allKeys) {
        NSArray *sortedAnagramGroupsArray = [anagramsDictionary[sortedCharWords] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

        [anagramsArray addObject:[sortedAnagramGroupsArray componentsJoinedByString:@","]];
    }

    NSArray *sortedAnagramsArray = [anagramsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    printf("%s", [[sortedAnagramsArray componentsJoinedByString:@"\n"] UTF8String]);
}

@end
