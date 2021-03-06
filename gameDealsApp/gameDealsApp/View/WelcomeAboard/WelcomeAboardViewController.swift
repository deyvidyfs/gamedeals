//
//  WelcomeAboardViewController.swift
//  gameDealsApp
//
//  Created by Deyvidy F.S on 24/06/21.
//

import Foundation
import UIKit
import WelcomeAboard

class WelcomeAboardViewController : UIViewController {
    
    override func loadView() {
        super.loadView()
        let content = createWAContent()
        view = WABaseView(content: content)
    }
    
    private func createWAContent() -> WAContent.Base {
           let color = UIColor(red:0.90, green:0.22, blue:0.31, alpha:1.00)
           let title = WAContent.Title(format: .multiline(welcomeText: "Welcome to"),
                                       text: "WelcomeAboard")

           let items = [
               WAContent.Card(title: "Receive New Users",
                              resume: "Tell us about your application, explain the main features and what else you want to tell!",
                              icon: UIImage(systemName: "person.2.square.stack.fill"),
                              iconTintColor: color),
               WAContent.Card(title: "Highlight Features",
                              resume: "I'm sure your application contains incredible features. Use this space to give more visibility.",
                              icon: UIImage(systemName: "text.bubble.fill"),
                              iconTintColor: color),
               WAContent.Card(title: "Notify Bugfixes",
                              resume: "Nobody likes to receive a bug report. Informing that annoying problem has been fixed is much more nicer.",
                              icon: UIImage(systemName: "hammer.fill"),
                              iconTintColor: color)
           ]

           let button = WAContent.Button(text: "Continue", backgroundColor: color) { [weak self] in
               self?.dismiss(animated: true)
           }

           return WAContent.Base(backgroundColor: .white,
                                 title: title,
                                 cards: items,
                                 button: button)
       }
    
}
