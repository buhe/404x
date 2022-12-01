//
//  Model.swift
//  404
//
//  Created by 顾艳华 on 2022/11/27.
//

import Foundation
import SwiftUI

struct Model {
    static var methodsConst = ["Base64"]
    
    var methods = methodsConst
    
    var method = methodsConst[0]
    
    var rawText: String = "编码前..."
    var encoding: String = "编码后..."
    
    var rawImage: UIImage?
}
