//
//  ScannerView.swift
//  Taroter
//
//  Created by Jakub Dąbrowski on 14/10/2021.
//

import SwiftUI

struct ScannerView: View {
    @AppStorage("isFirstTime") private var isFirstTime: Bool    = true
    @State private var cardNames: [String]                      = []
    
    var body: some View {
        NavigationView {
            VStack {
                if cardNames.isEmpty {
                    Text("Nothing there")
                        .foregroundColor(.gray)
                    
                    NavigationLink("Scan cards") {
                        Scanner(recognizedImages: $cardNames)
                            .navigationBarHidden(true)
                    }
                } else {
                    List {
                        ForEach(cardNames, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationBarHidden(false)
            .navigationBarTitle("Scanned Cards")
        }
        .onAppear(perform: setFirstTimeStatus)
    }
    
    func setFirstTimeStatus() {
        if isFirstTime {
            self.isFirstTime = false
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
