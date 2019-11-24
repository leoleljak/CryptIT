//
//  ViewController.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func criptClick(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    @IBAction func decriptClick(_ sender: Any) {
        self.tabBarController?.selectedIndex = 3
    }
    @IBAction func signGesture(_ sender: Any) {
        self.tabBarController?.selectedIndex = 2
    }
}


