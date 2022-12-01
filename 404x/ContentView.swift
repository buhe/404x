//
//  ContentView.swift
//  404
//
//  Created by 顾艳华 on 2022/11/27.
//

import SwiftUI

struct ContentView: View {
    var vm: ViewModel

    var body: some View {
        NavigationView {
            TabView {
                ConvertText(vm: vm)
                ConvertImage(vm: vm)
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ViewModel()
        ContentView(vm: vm)
    }
}
