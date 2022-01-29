//
//  ContentView.swift
//  Shared
//
//  Created by Dave Agyakwa on 12/01/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        if #available(macCatalyst 15.0, *) {
            NavigationView {

                    SignInView()
                    Spacer()


            }.navigationTitle("Build Over")
            .navigationViewStyle(.columns)

        } else {
            // Fallback on earlier versions
            NavigationView {
                Spacer()
                SignInView()

            }.navigationTitle("Build Over")
            .navigationViewStyle(.automatic)
        }
        }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
