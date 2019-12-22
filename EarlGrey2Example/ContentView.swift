//
//  ContentView.swift
//  EarlGrey2Example
//
//  Created by Szymon Kazmierczak on 04/12/2019.
//  Copyright © 2019 Szymon Kazmierczak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State private var show_modal: Bool = false
  
    var body: some View {
      Button(action: {
        self.show_modal = true
      }) {
        Text("Show Modal!")
      }.sheet(isPresented: self.$show_modal) {
        ModalView()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ModalView: View {
    var body: some View {
        Text("This is a modal!")
    }
}
