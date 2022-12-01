//
//  _04App.swift
//  404
//
//  Created by 顾艳华 on 2022/11/27.
//

import SwiftUI

@main
struct _04App: App {
    var body: some Scene {
        let vm = ViewModel()
        WindowGroup {
            ContentView(vm: vm)
        }
    }
}
