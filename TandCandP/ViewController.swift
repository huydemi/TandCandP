//
//  ViewController.swift
//  TandCandP
//
//  Created by Dang Quoc Huy on 7/18/17.
//  Copyright © 2017 Dang Quoc Huy. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class ViewController: UIViewController {
  @IBOutlet weak var tcpLabel: TTTAttributedLabel! {
    didSet {
      tcpLabel.delegate = self
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let message: NSString = "You agree to the Terms of Service, Privacy Policy and certify you are above 18 years of age."
    tcpLabel.text = message as String
    let tcRange: NSRange = message.range(of: "Terms of Service")
    let pRange: NSRange = message.range(of: "Privacy Policy")
    tcpLabel.addLink(to: URL(string: "https://www.google.com.vn")!, with: tcRange)
    tcpLabel.addLink(to: URL(string: "http://tuoitre.vn/")!, with: pRange)
  }
  
}

extension ViewController: TTTAttributedLabelDelegate {
  func attributedLabel(_ label: TTTAttributedLabel!, didSelectLinkWith url: URL!) {
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
}
