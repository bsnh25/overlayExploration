//
//  AppDelegate.swift
//  OverlayProject
//
//  Created by Bayu Septyan Nur Hidayat on 22/10/24.
//

import Cocoa
import AppKit


class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    
    var mainWindow: MainWindow?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        mainWindow = MainWindow()
        mainWindow?.delegate = self
        mainWindow?.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

