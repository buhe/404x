//
//  Ex.swift
//  404
//
//  Created by 顾艳华 on 2022/11/27.
//

import Foundation
extension StringProtocol {
    var data: Data { Data(utf8) }
    var base64Encoded: Data { data.base64EncodedData() }
    var base64Decoded: Data? { Data(base64Encoded: string) }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
extension Sequence where Element == UInt8 {
    var data: Data { .init(self) }
    var base64Decoded: Data? { Data(base64Encoded: data) }
    var string: String? { String(bytes: self, encoding: .utf8) }
}

//let original = "iOS Developer Tips encoded in Base64"
//
//let utf8Data = original.data                             // 36 bytes
//let base64EncodedString = utf8Data.base64EncodedString() //  aU9TIERldmVsb3BlciBUaXBzIGVuY29kZWQgaW4gQmFzZTY0\n"
//let base64EncodedData = utf8Data.base64EncodedData()     //  48 bytes"
//
//print("base64EncodedData:", original.base64Encoded)      //  48 bytes
//print("base64EncodedString:", original.base64Encoded.string ?? "") // "aU9TIERldmVsb3BlciBUaXBzIGVuY29kZWQgaW4gQmFzZTY0"
//print("base64DecodedData:", original.base64Encoded.string?.base64Decoded  ?? "") // 36 bytes
//print("base64DecodedString:", original.base64Encoded.base64Decoded?.string ?? "") // iOS Developer Tips encoded in Base64
