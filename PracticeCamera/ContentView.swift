//
//  ContentView.swift
//  PracticeCamera
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var addNewClothes = false
    @State private var addDayOutfit = false
    var body: some View {
        VStack {
            NavigationStack {
                Menu("+") {
                    NavigationLink(destination: addNewImage()){
                        Text("Add New CLothes to Your Closet")
                    }
        
                }
            }
        }
                
    }
            
}






#Preview {
    ContentView()
}
