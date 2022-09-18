//
//  ContentView.swift
//  mySwiftUI
//
//  Created by user on 15.09.22.
//

import SwiftUI

struct Name: Identifiable {
    @Сapital var name: String
    let id = UUID()
}

struct ContentView: View {
    
    let list: [Name] = [.init(name: "   Море    волнуется"), .init(name: ".море волнуется"), .init(name: "море   волнуется. раз"), .init(name: "море   волнуется  .  раз. два")]
    
    @State private var isFavorete: Bool = false
    
    var body: some View {
        List {
            Button {
                isFavorete.toggle()
            } label: {
                Text("On/Off")
            }
            ForEach(list) { item in
                if self.isFavorete {
                    Text(item.name)
                }
            }
        }.frame(width: .infinity, height: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
