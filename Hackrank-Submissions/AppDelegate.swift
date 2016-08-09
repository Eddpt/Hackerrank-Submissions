//
//  AppDelegate.swift
//  Hackrank-Submissions
//
//  Created by Eddpt on 04/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//        Contacts.contacts();

//        Anagram.anagram();

//        MinimumDistances.minimumDistances();

//        Operators.operators();

//        AllAnagrams.allAnagrams();

//        CookieParty.cookieParty();

        ParenthesisChecker.parenthesisChecker();

        return true
    }
}

