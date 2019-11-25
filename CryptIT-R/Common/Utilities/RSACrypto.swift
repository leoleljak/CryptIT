//
//  RSACrypto.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import Foundation
import SwiftyRSA
import RSASwiftGenerator

class RSACrypto {
    
   
    private let fileMan = FileManagment()
    private let randGen = RandomGenerator()

    func generateKeys() {
        
        
        
        do {
           let keyPair = try SwiftyRSA.generateRSAKeyPair(sizeInBits: 2048)
            
            let privateKey = keyPair.privateKey
             let publicKey = keyPair.publicKey
            
            
            fileMan.writeTo(text: try publicKey.pemString(), fileName: "publicKey.txt")
                
              
            
                    
            fileMan.writeTo(text: try privateKey.pemString(), fileName: "privateKey.txt")
            
        } catch  {
            print("Nije uspio generator")
        }
        
         
         
          
           
            
            
        
    }
    
    func setKeys(kljuc:String) {
       
    }
    
    func returnKey() -> String {
        return ""
    }
    
    func encrypt(tekst:String, publicKeyString:String){
       let txtForEnc = fileMan.read(fileName: tekst)
       let publicKeyPEM = fileMan.read(fileName: publicKeyString)
       
        do {
            let publicKey = try PublicKey(pemEncoded: publicKeyPEM!)
            let clear = try ClearMessage(string: txtForEnc!, using: .utf8)
            let encrypted = try clear.encrypted(with: publicKey, padding: .PKCS1)

            //let data = encrypted.data
            let base64String = encrypted.base64String
            fileMan.writeTo(text: base64String, fileName: "RSAEncryptedFile.txt")
        } catch  {
            
        }
       
        
       
              
          
       
        
    }

    func decrypt(tekst:String, privateKey:String) {
       
         let txtForDec = fileMan.read(fileName: tekst)
         let privateKeyPEM = fileMan.read(fileName: privateKey)
         
          do {
            let privateKey = try PrivateKey(pemEncoded: privateKeyPEM!)
            let encrypted = try EncryptedMessage(base64Encoded: txtForDec!)
              let clear = try encrypted.decrypted(with: privateKey, padding: .PKCS1)

              //let data = encrypted.data
              let base64String = clear.base64String
              let string = try clear.string(encoding: .utf8)
              fileMan.writeTo(text: string, fileName: "RSADecryptedFile.txt")
          } catch  {
              
          }
        
    }
    
    func makeSignature(text:String, kljuc:String) {
        
        let poruka = fileMan.read(fileName: text)
        let privateKeyPEM = fileMan.read(fileName: kljuc)
        
         do {
            
            let privateKey = try PrivateKey(pemEncoded: privateKeyPEM!)
            let clear = try ClearMessage(string: poruka!, using: .utf8)
            let signature = try clear.signed(with: privateKey, digestType: .sha1)
           
            let base64String = signature.base64String
            
            fileMan.writeTo(text: base64String, fileName: "Signature.txt")
            
            
         } catch  {
             print(error)
         }
        
       
    }
    
    func checkSignature(poruka:String, signature:String) -> Bool{
        
        
        var isSuccessful :Bool=false
        let publicKeyPEM = fileMan.read(fileName: "publicKey.txt")
         let signature = fileMan.read(fileName: "Signature.txt")
        let poruka = fileMan.read(fileName: poruka)
       
               
                do {
                    let signature = try Signature(base64Encoded: signature!)
                   let publicKey = try PublicKey(pemEncoded: publicKeyPEM!)
                   let clear = try ClearMessage(string: poruka!, using: .utf8)
                   isSuccessful = try clear.verify(with: publicKey, signature: signature, digestType: .sha1)
                   
                   
                } catch  {
                    
                }
               return isSuccessful
        
    }
    

           
}
