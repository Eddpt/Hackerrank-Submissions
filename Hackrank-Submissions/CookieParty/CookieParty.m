//
//  CookieParty.m
//  Hackrank-Submissions
//
//  Created by Eddpt on 08/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

#import "CookieParty.h"

@implementation CookieParty

+ (void)cookieParty
{
    unsigned long long nGuests = 3;
    unsigned long long mCookies = 2;
//    scanf("%llu %llu",&nGuests, &mCookies);

    unsigned long long remainder = (mCookies % nGuests);

    printf("%llu\n", (remainder == 0) ? 0 : (nGuests - remainder));
}

@end
