//
//  FileManager.swift
//  CryptIT
//
//  Created by Leo Leljak on 23/11/2019.
//  Copyright © 2019 Leo Leljak. All rights reserved.
//

import Foundation

class FileManagment{
    
    private var filename:URL!
    
    private func setFilename(name:String) {
        self.filename = getDocumentsDirectory().appendingPathComponent(name)
        print(filename!)
    }
    
    private func getDocumentsDirectory() -> URL {
           let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
           return paths[0]
       }
    
    func writeTo(text:String, fileName:String) {
        self.setFilename(name: fileName)
         do {
            try text.write(to: self.filename, atomically: true, encoding: String.Encoding.utf8)
               } catch {
                   // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
               }
    }
    
    
    
    func read(fileName:String) -> String? {
        self.setFilename(name: fileName)
        
        var text:String?
        do {
            text = try String(contentsOf: self.filename, encoding: .utf8)
            
        }
        catch {/* error handling here */}
        if text != nil {
            return text!
        }
       return nil
        
    }
    
}
