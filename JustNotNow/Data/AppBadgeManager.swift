//  AppBadgeManager.swift
//  JustNotNow
//  Created by Holger Hinzberg on 03.10.25.

import SwiftUI

class ApptBadgeManager {
    
    init() {
        Task {
            do {
                _ = try await requestAuthorizationForNotifications()
            } catch {
                print("Notification authorization request failed: \(error)")
            }
        }
    }
    
    func requestAuthorizationForNotifications() async throws -> Bool {
        // Get the shared instance of UNUserNotificationCenter
        let notificationCenter = UNUserNotificationCenter.current()
        // Define the types of authorization you need
        let authorizationOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        do {
            // Request authorization to the user
            let authorizationGranted = try await notificationCenter.requestAuthorization(options: authorizationOptions)
            // Return the result of the authorization process
            return authorizationGranted
        } catch {
            throw error
        }
    }
    
    func setBadgeNumber(_ number: Int) {
        Task {
            do {
                let notificationCenter = UNUserNotificationCenter.current()
                let currentSettings = await notificationCenter.notificationSettings()
                if (currentSettings.authorizationStatus == .authorized)
                {
                    try await notificationCenter.setBadgeCount(number)
                    print("Badge Count set to \(number)")
                }
            } catch {
                print("Error setting the badge count")
            }
        }
    }
}

