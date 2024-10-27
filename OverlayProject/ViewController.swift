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

class ViewController: NSWindowController {
    
    let overlayRive = RiveViewModel(fileName: "overlay_notification", artboardName: "sad")
    
    convenience init() {
        let screenFrame = NSScreen.main?.frame ?? NSRect(x: 0, y: 0, width: 800, height: 600)
        
        let offScreenFrame = NSRect(x: 0, y: -screenFrame.height, width: screenFrame.width, height: screenFrame.height)
        
        let overlayWindow = NSPanel(contentRect: offScreenFrame,
                                    styleMask: [.borderless],
                                    backing: .buffered,
                                    defer: false)
        
        overlayWindow.isOpaque = false
        overlayWindow.backgroundColor = .clear
        overlayWindow.level = .screenSaver + 1
        overlayWindow.collectionBehavior = [.canJoinAllSpaces, .stationary, .ignoresCycle, .fullScreenPrimary, .transient]
        overlayWindow.styleMask.insert(.nonactivatingPanel)
        overlayWindow.isFloatingPanel = true
        
        self.init(window: overlayWindow)
        setupOverlayContent()
        //        showOverlay()
    }
    
    private func setupOverlayContent() {
        
        guard let overlayWindow = self.window else { return }
        
        let overlayView = NSView(frame: overlayWindow.contentView!.bounds)
        overlayView.wantsLayer = true
        overlayView.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.7).cgColor
        window?.contentView?.addSubview(overlayView)
        
        //        // Gambar untuk karakter
        //        let imageView = NSImageView()
        //        imageView.image = NSImage(named: "Male")
        //        imageView.translatesAutoresizingMaskIntoConstraints = false
        //        imageView.imageScaling = .scaleAxesIndependently
        //        overlayView.addSubview(imageView)
        
        // Rive Animation View
        let riveView = overlayRive.createRiveView()
        riveView.layer?.borderColor = .white
        riveView.layer?.borderWidth = 1
        riveView.translatesAutoresizingMaskIntoConstraints = false
        riveView.frame = overlayView.bounds
        overlayView.addSubview(riveView)
        
        // Background View untuk teks dan tombol
        let textBackgroundView = NSView()
        textBackgroundView.wantsLayer = true
        textBackgroundView.layer?.backgroundColor = NSColor.white.withAlphaComponent(1).cgColor
        textBackgroundView.layer?.cornerRadius = 10
        textBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.addSubview(textBackgroundView)
        
        // Teks balon percakapan di dalam background view
        let speechBubble = NSTextField(labelWithString: "Hey! I need stretching now.\nLet's start it now!")
        speechBubble.font = NSFont.systemFont(ofSize: 16)
        speechBubble.textColor = .black
        speechBubble.backgroundColor = .clear
        speechBubble.isBezeled = false
        speechBubble.isEditable = false
        speechBubble.alignment = .center
        speechBubble.translatesAutoresizingMaskIntoConstraints = false
        textBackgroundView.addSubview(speechBubble)
        
        // Tombol di sudut kanan bawah background view
        let dismissButton = NSButton(title: "Okey", target: self, action: #selector(dismissOverlay))
        dismissButton.bezelStyle = .rounded
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        textBackgroundView.addSubview(dismissButton)
        
//        // Constraints untuk posisi elemen-elemen
//        NSLayoutConstraint.activate([
//            // ImageView
//            //            imageView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 50),
//            //            imageView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: 50),
//            //            imageView.widthAnchor.constraint(equalToConstant: 300),
//            //            imageView.heightAnchor.constraint(equalToConstant: 600),
//            // Rive Animation View
//            riveView.leadingAnchor.constraint(equalTo: overlayView.leadingAnchor, constant: 50),
//            riveView.bottomAnchor.constraint(equalTo: overlayView.bottomAnchor, constant: 50),
//            riveView.widthAnchor.constraint(equalToConstant: 300),
//            riveView.heightAnchor.constraint(equalToConstant: 600),
//            
//            // Background View
//            textBackgroundView.leadingAnchor.constraint(equalTo: riveView.leadingAnchor),
//            textBackgroundView.bottomAnchor.constraint(equalTo: riveView.topAnchor, constant: -20),
//            textBackgroundView.widthAnchor.constraint(equalToConstant: 220),
//            textBackgroundView.heightAnchor.constraint(equalToConstant: 90),
//            
//            // Speech Bubble (NSTextField)
//            speechBubble.leadingAnchor.constraint(equalTo: textBackgroundView.leadingAnchor, constant: 10),
//            speechBubble.topAnchor.constraint(equalTo: textBackgroundView.topAnchor, constant: 10),
//            
//            // Dismiss Button
//            dismissButton.trailingAnchor.constraint(equalTo: textBackgroundView.trailingAnchor, constant: -10),
//            dismissButton.bottomAnchor.constraint(equalTo: textBackgroundView.bottomAnchor, constant: -10),
//        ])
        
        // ImageView
        // imageView.snp.makeConstraints { make in
        //     make.leading.equalTo(overlayView).offset(50)
        //     make.bottom.equalTo(overlayView).offset(50)
        //     make.width.equalTo(300)
        //     make.height.equalTo(600)
        // }

        // Rive Animation View
        riveView.snp.makeConstraints { make in
            make.leading.equalTo(overlayView).offset(50)
            make.bottom.equalTo(overlayView).offset(50)
            make.width.equalTo(300)
            make.height.equalTo(600)
//            make.edges.equalToSuperview()
        }

        // Background View
        textBackgroundView.snp.makeConstraints { make in
            make.leading.equalTo(riveView.snp.leading)
            make.bottom.equalTo(riveView.snp.top).offset(-20)
            make.width.equalTo(220)
            make.height.equalTo(90)
        }

        // Speech Bubble (NSTextField)
        speechBubble.snp.makeConstraints { make in
            make.leading.equalTo(textBackgroundView).offset(10)
            make.top.equalTo(textBackgroundView).offset(10)
        }

        // Dismiss Button
        dismissButton.snp.makeConstraints { make in
            make.trailing.equalTo(textBackgroundView).offset(-10)
            make.bottom.equalTo(textBackgroundView).offset(-10)
        }
    }
    
    func showOverlay() {
        guard let overlayWindow = self.window else { return }
        
        overlayWindow.setFrame(NSScreen.main?.frame ?? overlayWindow.frame, display: false)
        NSApp.runModal(for: overlayWindow)
        overlayWindow.alphaValue = 0
        overlayWindow.makeKeyAndOrderFront(nil)
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeOut)
            overlayWindow.animator().alphaValue = 1
            overlayWindow.animator().setFrame(NSScreen.main?.frame ?? overlayWindow.frame, display: true)
        }
        
    }
    
    @objc private func dismissOverlay() {
        guard let overlayWindow = self.window else { return }
        
        NSAnimationContext.runAnimationGroup { context in
            context.duration = 0.5
            context.timingFunction = CAMediaTimingFunction(name: .easeIn)
            overlayWindow.animator().alphaValue = 0
        } completionHandler: {
            overlayWindow.close()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            NSApp.stopModal()
        }
        
    }
    
    @objc private func applicationDidBecomeActive() {
        guard let overlayWindow = self.window else { return }
        
        if overlayWindow.isVisible {
            overlayWindow.makeKeyAndOrderFront(nil)
        }
    }
}

