//
//  AESCrypto.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import Foundation
import CryptoSwift

class AESCrypto {
    
    private var key: String = "keykeykeykeykeyk"
    private let iv: String =  "kdaj344nfje34r#$"
    private let fileMan = FileManagment()
    private let randGen = RandomGenerator()

    func generateKey() {
        self.key = randGen.randomString(length: 16)
        fileMan.writeTo(text: self.key, fileName: "secretKey.txt")
    }
    
    func generateKey(kljuc:String) {
        self.key = kljuc
        fileMan.writeTo(text: self.key, fileName: "secretKey.txt")
    }
    
    func returnKey() -> String {
        return key
    }
    
    func encrypt(tekst:String){
        let txtForEnc = fileMan.read(fileName: tekst)
        //var ciphertext:[UInt8]?
        
         if let aes = try? AES(key: key, iv: iv),
            let encrypted = try? aes.encrypt(Array<UInt8>(txtForEnc!.utf8)) {
                    
              fileMan.writeTo(text: encrypted.toHexString(), fileName: "AESEncryptedFile.txt")
               }
              
          
       
        
    }

    func decrypt(tekst:String, kljuc:String) {
        let txtForDec = fileMan.read(fileName: tekst)
        let kljuc = fileMan.read(fileName: kljuc)
        //print(txtForDec)
        
        if let aes = try? AES(key: kljuc!, iv: iv),
            let decrypted = try? aes.decrypt(Array<UInt8>(hex: txtForDec!)) {
            
            fileMan.writeTo(text: String(data: Data(decrypted), encoding: .utf8)!, fileName: "AESDecryptedFile.txt")
        }
        
        
       
        
    }
    

           
}
