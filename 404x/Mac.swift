//
//  Mac.swift
//  404x
//
//  Created by 顾艳华 on 2022/12/1.
//

import SwiftUI

typealias UIImage = NSImage

extension Image {
    init(uiImage: UIImage) {
        self = Image(nsImage: uiImage)
    }
}
