//
//  TextSaveVC.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import UIKit
import SCLAlertView

class TextSaveVC: UIViewController {

    //MARK: -IBOutlets
    
    @IBOutlet weak var txtText: UITextView!
    
    //MARK: -Properties
    let fileManagment = FileManagment()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    
    @IBAction func btnSaveText(_ sender: Any) {
        if !txtText.text.isEmpty{
            fileManagment.writeTo(text: txtText.text, fileName: "fileForEncryption.txt")
            SCLAlertView().showSuccess("Poruka je upisana", subTitle: "Datoteka je zapisana u fileForEncrypt.txt")
            
        }
        else {
            SCLAlertView().showError("Poruka nije upisana", subTitle: "Nema teksta")
            
        }
      
        
    }
    
    //read
    
    @IBAction func btnReadTxt(_ sender: Any) {
        
      
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


