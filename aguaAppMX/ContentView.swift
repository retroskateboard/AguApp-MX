//
//  ContentView.swift
//  aguaAppMX
//
//  Created by Eric Rojas Pech on 22/11/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var log_Status: Bool = false
    var body: some View {
        Group{
            if log_Status{
                MainPage()
            } else{
                IntroView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
