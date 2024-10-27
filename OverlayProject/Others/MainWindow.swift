//
//  MainWindow.swift
//  OverlayProject
//
//  Created by Bayu Septyan Nur Hidayat on 22/10/24.
//

import AppKit
import Cocoa

class MainWindow: NSWindow {
    
//    var viewController: ViewController?
    
    init() {
        super.init(
            contentRect: NSRect(x: 0, y: 0, width: 1200, height: 840),
            styleMask: [
                .titled, .closable, .miniaturizable, .fullSizeContentView
            ],
            backing: .buffered,
            defer: false
        )
        
        titlebarAppearsTransparent = true
        center()
        let vc = MainVC()
        contentView             = vc.view
        contentViewController   = vc
        
    }
}
