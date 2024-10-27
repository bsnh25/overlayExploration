//
//  ViewController.swift
//  OverlayProject
//
//  Created by Bayu Septyan Nur Hidayat on 22/10/24.
//

import Cocoa
import AppKit
import RiveRuntime
import SnapKit

//class ViewController: NSWindowController {
//
//    let overlayRive = RiveViewModel(fileName: "overlay_notification", artboardName: "sad")
//
//    convenience init() {
//        let screenFrame = NSScreen.main?.frame ?? NSRect(x: 0, y: 0, width: 800, height: 600)
//
//        let overlayWindow = NSPanel(contentRect: screenFrame,
//                                    styleMask: [.borderless, .nonactivatingPanel],
//                                    backing: .buffered,
//                                    defer: false)
//
//        overlayWindow.isFloatingPanel = true
//        overlayWindow.hidesOnDeactivate = false
//        overlayWindow.hasShadow = false
//        overlayWindow.becomesKeyOnlyIfNeeded = true
//        overlayWindow.level = .mainMenu
//        overlayWindow.backgroundColor = .clear
//        overlayWindow.collectionBehavior = [.canJoinAllSpaces]
//        overlayWindow.animationBehavior = .alertPanel
//        overlayWindow.ignoresMouseEvents = true
//
//
//        self.init(window: overlayWindow)
//        setupOverlayContent()
//
//    }
//
//    private func setupOverlayContent() {
//
//        guard let overlayWindow = self.window else { return }
//
//        let overlayView = NSView(frame: overlayWindow.contentView!.bounds)
//        overlayView.wantsLayer = true
//        overlayView.layer?.backgroundColor = .clear
//        window?.contentView?.addSubview(overlayView)
//
//        // Rive Animation View
//        let riveView = overlayRive.createRiveView()
//        riveView.layer?.borderColor = .white
//        riveView.layer?.borderWidth = 1
//        riveView.translatesAutoresizingMaskIntoConstraints = false
//        riveView.frame = overlayView.bounds
//        overlayView.addSubview(riveView)
//
//        // Background View untuk teks dan tombol
//        let textBackgroundView = NSView()
//        textBackgroundView.wantsLayer = true
//        textBackgroundView.layer?.backgroundColor = NSColor.white.withAlphaComponent(1).cgColor
//        textBackgroundView.layer?.cornerRadius = 10
//        textBackgroundView.translatesAutoresizingMaskIntoConstraints = false
//        overlayView.addSubview(textBackgroundView)
//
//        // Teks balon percakapan di dalam background view
//        let speechBubble = NSTextField(labelWithString: "Hey! I need stretching now.\nLet's start it now!")
//        speechBubble.font = NSFont.systemFont(ofSize: 16)
//        speechBubble.textColor = .black
//        speechBubble.backgroundColor = .clear
//        speechBubble.isBezeled = false
//        speechBubble.isEditable = false
//        speechBubble.alignment = .center
//        speechBubble.translatesAutoresizingMaskIntoConstraints = false
//        textBackgroundView.addSubview(speechBubble)
//
//        // Tombol di sudut kanan bawah background view
//        let dismissButton = NSButton(title: "Okey", target: self, action: #selector(dismissOverlay))
//        dismissButton.bezelStyle = .rounded
//        dismissButton.translatesAutoresizingMaskIntoConstraints = false
//        textBackgroundView.addSubview(dismissButton)
//
//        // Rive Animation View
//        riveView.snp.makeConstraints { make in
//            //            make.leading.equalTo(overlayView).offset(50)
//            //            make.bottom.equalTo(overlayView).offset(50)
//            //            make.width.equalTo(300)
//            //            make.height.equalTo(600)
//            make.edges.equalToSuperview()
//        }
//
//        // Background View
//        textBackgroundView.snp.makeConstraints { make in
//            //            make.leading.equalTo(riveView.snp.leading)
//            //            make.bottom.equalTo(riveView.snp.top).offset(20)
//            make.centerX.equalTo(riveView.snp.centerX)
//            make.centerY.equalTo(riveView.snp.centerY)
//            make.width.equalTo(220)
//            make.height.equalTo(90)
//        }
//
//        // Speech Bubble (NSTextField)
//        speechBubble.snp.makeConstraints { make in
//            make.leading.equalTo(textBackgroundView).offset(10)
//            make.top.equalTo(textBackgroundView).offset(10)
//        }
//
//        // Dismiss Button
//        dismissButton.snp.makeConstraints { make in
//            make.trailing.equalTo(textBackgroundView).offset(-10)
//            make.bottom.equalTo(textBackgroundView).offset(-10)
//        }
//
//    }
//
//    func showOverlay() {
//        guard let overlayWindow = self.window else { return }
//
//        overlayWindow.setFrame(NSScreen.main?.frame ?? overlayWindow.frame, display: false)
////        NSApp.activate(ignoringOtherApps: true)
////        NSApp.runModal(for: overlayWindow)
//        overlayWindow.alphaValue = 0
//        overlayWindow.makeKeyAndOrderFront(nil)
//
//        NSAnimationContext.runAnimationGroup { context in
//            context.duration = 0.5
//            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
//            overlayWindow.animator().alphaValue = 1
//            overlayWindow.animator().setFrame(NSScreen.main?.frame ?? overlayWindow.frame, display: true)
//        }
//
//    }
//
//    @objc private func dismissOverlay() {
//        guard let overlayWindow = self.window else { return }
//
//        NSAnimationContext.runAnimationGroup { context in
//            context.duration = 0.5
//            context.timingFunction = CAMediaTimingFunction(name: .easeIn)
//            overlayWindow.animator().alphaValue = 0
//        } completionHandler: {
//            overlayWindow.close()
//        }
//
////        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
////            NSApp.stopModal()
////        }
//
//    }
//
//    @objc private func applicationDidBecomeActive() {
//        guard let overlayWindow = self.window else { return }
//
//        if overlayWindow.isVisible {
//            overlayWindow.makeKeyAndOrderFront(nil)
//        }
//    }
//}

class NotificationOverlayWindow: NSWindowController {
    
    init() {
        let frame = NSScreen.main?.frame ?? .zero
        let window = NSPanel(
            contentRect: frame,
            styleMask: [.borderless, .nonactivatingPanel],
            backing: .buffered,
            defer: false
        )
        
        window.isFloatingPanel = true
        window.hidesOnDeactivate = false
        window.hasShadow = false
        window.becomesKeyOnlyIfNeeded = true
        window.level = .mainMenu
        window.backgroundColor = .clear
        window.collectionBehavior = [.canJoinAllSpaces]
        window.animationBehavior = .alertPanel
        
        super.init(window: window)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViewContoller(_ vc: NSViewController) {
        let vc = NotificationOverlayViewController()
        
        vc.delegate = self
        window?.contentViewController = vc
        window?.contentView = vc.view
        
    }
    
    func show() {
        guard let window else { return }
        let frame = NSScreen.main?.frame ?? .zero
        
        let frameOverlay = CGRect(x: 0, y: 0, width: Int(frame.width * 0.5), height: Int(frame.height * 0.8))
        
        window.setFrame(frameOverlay, display: false)
        
        window.alphaValue = 0
        window.makeKeyAndOrderFront(nil)
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
            window.animator().alphaValue = 1
        }
    }
    
    func dismiss() {
        guard let window else { return }
        
        window.alphaValue = 1
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
            window.animator().alphaValue = 0
        } completionHandler: {
            window.orderOut(nil)
        }
        
    }
    
}

extension NotificationOverlayWindow: NotificationOverlayDelegate {
    func didOverlayDismissed() { dismiss() }
}

class NotificationOverlayViewController: NSViewController {
    let climbrVm = RiveViewModel(fileName: "overlay_notification", artboardName: "sad")
    let btn = NSButton()
    var delegate: NotificationOverlayDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let riveView = climbrVm.createRiveView()
        riveView.frame = view.bounds
        
        view.addSubview(riveView)
        
        btn.title = "Dismiss Aku"
        btn.target = self
        btn.action = #selector(self.dismissVC)
        riveView.addSubview(btn)
        
        riveView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        btn.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    @objc private func dismissVC() {
        delegate?.didOverlayDismissed()
    }
    
}

protocol NotificationOverlayDelegate {
    func didOverlayDismissed()
}
