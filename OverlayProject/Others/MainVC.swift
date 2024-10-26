//
//  MainVC.swift
//  OverlayProject
//
//  Created by Bayu Septyan Nur Hidayat on 22/10/24.
//

import AppKit
import Cocoa

class MainVC: NSViewController {
    
    var overlayController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.blue.cgColor
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        overlayController = ViewController()
//        overlayController?.showWindow(nil)
        overlayController?.showOverlay()
    }
    
}
