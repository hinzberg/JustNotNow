//
//  JustNotNowApp.swift
//  JustNotNow
//
//  Created by Holger Hinzberg on 19.04.25.
//

import SwiftUI

@main
struct JustNotNowApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
    }
}
