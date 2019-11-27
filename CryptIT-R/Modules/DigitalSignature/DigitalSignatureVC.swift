//
//  DigitalSignatureVC.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import UIKit
import SCLAlertView

class DigitalSignatureVC: UIViewController {

    @IBOutlet weak var txtDat: UITextField!
    
    @IBOutlet weak var txtKey: UITextField!
    
    let cryptoRSA = RSACrypto()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func btnProvjeri(_ sender: Any) {
        let ret = cryptoRSA.checkSignature(poruka: txtDat.text!, signature: txtKey.text!)
        print("Digitalni potpis je \(ret)")
        switch ret {
        case true:
             SCLAlertView().showSuccess("Potpis je valjan", subTitle: "Datoteka koju posjedujete je došla u originalnom obliku")
        case false:
            SCLAlertView().showWarning("Potpis nije valjan", subTitle: "Datoteka koju posjeduje je komprimitirana !")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
