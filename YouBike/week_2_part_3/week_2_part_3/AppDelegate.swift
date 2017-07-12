//
//  AppDelegate.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/8/23.
//  Copyright © 2016年 許雅筑. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FacebookCore
import FacebookLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //TabBar color

        UITabBar.appearance().backgroundColor = UIColor(red: 61/250, green: 52/250, blue: 66/250, alpha: 1)
        UITabBar.appearance().tintColor = UIColor(red: 251/250, green: 197/250, blue: 111/250, alpha: 1)
        UITabBar.appearance().barTintColor = UIColor(red: 61/250, green: 52/250, blue: 66/250, alpha: 1)
//        UITabBar.appearance().barTintColor = UIColor(red: 61/255, green: 52/255, blue: 66/255,alpha: 1)
//        UITabBar.appearance().backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//        UITabBar.appearance().tintColor = UIColor(red: 251/255, green: 197/255, blue: 111/255, alpha: 1)
        
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    
    func application(application:UIApplication,openURL url: NSURL,sourceApplication: String?,annotation: AnyObject) -> Bool{
        return FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                     openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AppEventsLogger.activate(application)

        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}