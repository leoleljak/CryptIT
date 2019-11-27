//
//  EncryptionVC.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import UIKit
import SCLAlertView
import Spring

class EncryptionVC: UIViewController {

    //MARK: -IBOutlets
    
    @IBOutlet weak var txtKey: UITextField!
    @IBOutlet weak var txtDat: UITextField!
    @IBOutlet weak var txtDatToSignature: UITextField!
    @IBOutlet weak var btnSignature: UIButton!
    @IBOutlet weak var btnSignatureAnimate: SpringButton!
    @IBOutlet weak var switcherSegment: UISegmentedControl!
    
    //MARK: -Properties
    let AESCrypt = AESCrypto()
    let RSACrypt = RSACrypto()
    var kljuc:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @IBAction func btnDigitalnoPotpisi(_ sender: Any) {
        RSACrypt.makeSignature(text: txtDat.text!, kljuc: "privateKey.txt")
       
        
        SCLAlertView().showInfo("Potpisali ste poruku", subTitle: "Bravo")
        
    }
    
    @IBAction func btnCript(_ sender: Any) {
        
        switch switcherSegment.selectedSegmentIndex {
        case 0:
            AESCrypt.generateKey()
            kljuc = AESCrypt.returnKey()
            AESCrypt.encrypt(tekst: txtDat.text!)
            txtKey.text = kljuc
            
        case 1:
             RSACrypt.generateKeys()
               kljuc = RSACrypt.returnKey()
               RSACrypt.encrypt(tekst: txtDat.text!, publicKeyString: "publicKey.txt")
               txtKey.text = kljuc
               btnSignature.isHidden = false
               btnSignatureAnimate.animate()
        default:
            break
        }
        
    }
}
