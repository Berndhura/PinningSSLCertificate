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
    
    private var sessionManager: SessionManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "https://www.apple.com")!
        
        enableCertificatePinning()
        
        sessionManager?.request(url).responseData { result in
        
        }
        
        Alamofire.request(url).responseData { result in
            if let data = result.data, let requestURL = result.request?.url {
                self.webView.load(data, mimeType: result.response?.mimeType ?? "", characterEncodingName: result.response?.textEncodingName ?? "", baseURL: requestURL)
            }
        }
    }
    
    private func enableCertificatePinning() {
        //let certificates: [SecCertificate] = []
        let certificates = getCertificates()
        let trustPolicy = ServerTrustPolicy.pinCertificates(
            certificates: certificates,
            validateCertificateChain: true,
            validateHost: true)
        let trustPolicies = [ "www.apple.com": trustPolicy ]
        let policyManager =  ServerTrustPolicyManager(policies: trustPolicies)
        sessionManager = SessionManager(
            configuration: .default,
            serverTrustPolicyManager: policyManager)
    }
    
    private func getCertificates() -> [SecCertificate] {
        let url = Bundle.main.url(forResource: "appleCert", withExtension: "cer")!
        let localCertificate = try! Data(contentsOf: url) as CFData
        guard let certificate = SecCertificateCreateWithData(nil, localCertificate)
            else { return [] }
        
        return [certificate]
    }
}

