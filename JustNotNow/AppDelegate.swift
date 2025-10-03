//  AppDelegate.swift
//  JustNotNow
//  Created by Holger Hinzberg on 19.04.25.

import UIKit

class AppDelegate : NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        let veryPeriColor = UIColor(hex: "#6667AB") //    red: 102, green: 103, blue: 171
        let cloudDancerColor = UIColor(hex: "#f0eee9")
        
        let appearance = CustomNavigationBarAppearance.DefaultAppearance // UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: cloudDancerColor!]
        appearance.largeTitleTextAttributes = [.foregroundColor: cloudDancerColor!]
                                          
        appearance.backgroundColor = veryPeriColor
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = cloudDancerColor
        UITabBar.appearance().backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 1)
        
        return true
    }
}
