//
//  ViewModel.swift
//  404
//
//  Created by 顾艳华 on 2022/11/27.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var model = Model()
    
    func encodingText() {
        switch model.method {
        case "Base64": model.encoding = model.rawText.data.base64EncodedString()
        default: break
        }
    }
    
    func decodingText() {
        switch model.method {
        case "Base64": model.rawText = model.encoding.data.base64Decoded?.string ?? ""
        default: break
        }
    }
    
    func encodingImage() {
        switch model.method {
        case "Base64":
            if let image = model.rawImage {
                print("image is not null.")
                DispatchQueue.global(qos: .userInteractive).async {
//                    let s = image.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
//                    DispatchQueue.main.async {
//                        print("base64 is \(s)")
//                        self.model.encoding = s
//                    }
                }
                
            }
        default: break
        }
    }
    
    func decodingImage() {
        switch model.method {
        case "Base64":
            let imageData = Data(base64Encoded: model.encoding)
            if let data = imageData {
                model.rawImage = UIImage(data: data)
            }
        default: break
        }
    }
}
