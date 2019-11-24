//
//  DecryptionVC.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import UIKit
import Spring

class DecryptionVC: UIViewController {

    //MARK: -IBOutlets
    
    @IBOutlet weak var txtFileName: UITextField!
    @IBOutlet weak var txtKljuc: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var txtDekriptiranTekst: UITextView!
    @IBOutlet weak var txtViewSpring: SpringTextView!
    
    //MARK: -Properties
    let AESCrypt = AESCrypto()
    let RSACrypt = RSACrypto()
    let fileMan = FileManagment()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDekriptiraj(_ sender: Any) {
        
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            AESCrypt.decrypt(tekst: txtFileName.text!, kljuc: txtKljuc.text!)
            txtDekriptiranTekst.text = fileMan.read(fileName: "AESDecryptedFile.txt")
        case 1:
            RSACrypt.decrypt(tekst: txtFileName.text!, privateKey: txtKljuc.text!)
            txtDekriptiranTekst.text = fileMan.read(fileName: "RSADecryptedFile.txt")
        default:
            break
        }
        
    }
    
    @IBAction func btnEditingEND(_ sender: Any) {
        
        if let tekst = fileMan.read(fileName: txtFileName.text!) {
            txtDekriptiranTekst.text = tekst
            txtDekriptiranTekst.isHidden = false;
            txtViewSpring.animate()
        }
        else{
            txtDekriptiranTekst.text = ""
        }
            
        
    }
    @IBAction func btnOtvoriDigitalniPotpis(_ sender: Any) {
        let dpSB:UIStoryboard = UIStoryboard(name: "DigitalSignature", bundle: nil)
        let vc = dpSB.instantiateViewController(identifier: "DigitalSignature") as! DigitalSignatureVC
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
        
        
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
