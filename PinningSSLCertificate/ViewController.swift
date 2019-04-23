//
//  ViewController.swift
//  PinningSSLCertificate
//
//  Created by bernd wichura on 23.04.19.
//  Copyright © 2019 bernd wichura. All rights reserved.
//

import UIKit
import Alamofire
import WebKit

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.apple.com")!
        Alamofire.request(url).responseData { result in
            if let data = result.data, let requestURL = result.request?.url {
                self.webView.load(data, mimeType: result.response?.mimeType ?? "", characterEncodingName: result.response?.textEncodingName ?? "", baseURL: requestURL)
            }
        }
    }
}

