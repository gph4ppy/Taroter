//
//  MainView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct MainView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    
    var body: some View {
        if isFirstTime {
            WelcomeView()
        } else {
            TabView {
                ScannerView()
                    .tabItem {
                        Label("Scan",
                              systemImage: "camera.viewfinder")
                    }
                
                AllCardsView()
                    .tabItem {
                        Label("Cards",
                              systemImage: "doc.text.image.fill")
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
