//
//  ConvertImage.swift
//  404
//
//  Created by 顾艳华 on 2022/11/28.
//

import SwiftUI

struct ConvertImage: View {
    @ObservedObject var vm: ViewModel
    @State private var showSheet = false
    @State private var showPhotoLib = false
    @State private var showCamera = false
    @State private var showDatePick = false
    
    var body: some View {
        ScrollView {
            VStack {
                if let raw = vm.model.rawImage {
                    Image(uiImage: raw).resizable().frame(height: 384).padding()
                } else {
                    Color.white.frame(height: 384).padding()
                }
            
                NavigationView {
                HStack {
                        Button{
                           if hasCamera() {
                               showCamera = true
                           }
                       } label: {Image(systemName: "camera")}
                       .sheet(isPresented: $showCamera) {
                           ImagePicker(sourceType: .camera) {
                                                       seleted in
                               vm.model.rawImage = seleted
                                                   }
                       }.padding(.trailing)
                       Button{
                           showPhotoLib = true
                       }label: {Image(systemName: "photo.artframe")}
                       .sheet(isPresented: $showPhotoLib) {
                           ImagePicker(sourceType: .photoLibrary) {
                                                       seleted in
                               vm.model.rawImage = seleted
                                                   }
                       }.padding(.trailing)
                     Button{
                         vm.encodingImage()
                     } label: {
                       Text("编码")
                     }
                    Button{
                        vm.decodingImage()
                    } label: {
                      Text("解码")
                    }
                    Picker("method?", selection: $vm.model.method) {
                         ForEach(vm.model.methods, id: \.self) {
                             Text($0)
                         }
                     }.frame(minWidth: 100)
    //                    Toggle("With", isOn: $with).labelsHidden()
                    ShareLink(item: vm.model.encoding) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    Spacer()
                    }
                }.frame(maxHeight: 44).padding()
       
                TextField("resultText", text: $vm.model.encoding, axis: .vertical).lineLimit(15...15).padding()
            }
        }.tabItem{Label("图片", systemImage: "photo")}
    }
    
    private func hasCamera() -> Bool {
        false
    }
}

//struct ConvertImage_Previews: PreviewProvider {
//    static var previews: some View {
//        ConvertImage()
//    }
//}
