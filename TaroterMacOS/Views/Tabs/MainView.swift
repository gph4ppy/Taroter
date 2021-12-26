//
//  MainView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 24/12/2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    //    @Environment(\.managedObjectContext) private var viewContext
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //    private var items: FetchedResults<Item>
    //
    //    @State private var selectedTab: String = LocalizedStrings.allCards
    @State private var selectedTab: String = ""
    @State private var spreadSearchText: String = ""
    
    var body: some View {
        GeometryReader { geom in
            HStack {
                // Side Bar
                ZStack {
                    BlurView()
                    
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 4) {
                            // MARK: - Cards
                            Text(LocalizedStrings.cards)
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            
                            SideBarButton(title: LocalizedStrings.allCards,
                                          systemImage: "rectangle.grid.3x2.fill",
                                          selectedTab: $selectedTab)
                            
                            SideBarButton(title: LocalizedStrings.majorArcana,
                                          systemImage: "globe.asia.australia.fill",
                                          selectedTab: $selectedTab)
                            
                            SideBarButton(title: LocalizedStrings.minorArcana,
                                          systemImage: "wand.and.stars",
                                          selectedTab: $selectedTab)
                            
                            // MARK: - Spreads
                            Text("Spreads")
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                                .padding(.top)
                            
                            Spacer()
                        }
                        .padding()
                    }
                }
                .frame(width: geom.size.width / 5)
                .font(.callout)
                
                // Main View
                switch selectedTab {
                    // MARK: - Cards
                case LocalizedStrings.allCards: CardsView(selectedTab: .allCards)
                case LocalizedStrings.majorArcana: CardsView(selectedTab: .major)
                case LocalizedStrings.minorArcana: CardsView(selectedTab: .minor)
                    
                    // MARK: - Spreads
                default: CreateSpreadTemplateView()
                }
            }
        }
    }
    
    //    private func addItem() {
    //        withAnimation {
    //            let newItem = Item(context: viewContext)
    //            newItem.timestamp = Date()
    //
    //            PersistenceController.shared.save()
    //        }
    //    }
    //
    //    private func deleteItems(offsets: IndexSet) {
    //        withAnimation {
    //            offsets.map { items[$0] }.forEach(viewContext.delete)
    //
    //            PersistenceController.shared.save()
    //        }
    //    }
}

//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()

struct Preview: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct SpreadCard {
    let id: UUID
    let number: Int
    var location: CGPoint
    var meaning: String
}

struct CreateSpreadTemplateView: View {
    @State private var counter: Int      = 1
    @State private var location: CGPoint = CGPoint(x: 50, y: 50)
    
    var body: some View {
        ScrollView {
            Button(action: { self.counter += 1}) {
                Image(systemName: "plus")
            }
            .frame(maxWidth: .infinity,
                   alignment: .topTrailing)
            
            ForEach(1 ... counter, id: \.self) { num in
                var card = SpreadCard(id: UUID(),
                                      number: num,
                                      location: location,
                                      meaning: "")
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 74.75, height: 124.75)
                    .overlay(
                        Text(String(num))
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                    )
                    .position(card.location)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.location = value.location
                            }
                    )
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct CreateSpreadView: View {
    @Namespace var namespace
    @State private var showingCardPicker: Bool = false
    private let columns: [GridItem]            = [GridItem(.adaptive(minimum: 150))]
    @State private var cardState: CGSize       = .zero
    
    var body: some View {
        VStack(alignment: .center) {
            if showingCardPicker {
                Rectangle()
                    .overlay(alignment: .top) {
                        VStack {
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        self.showingCardPicker = false
                                    }
                                }
                                .padding()
                            
                            LazyVGrid(columns: columns) {
                                ForEach(TarotCards.allCases,
                                        id: \.self,
                                        content: createGridCard)
                            }
                            .padding()
                        }
                        
                    }
                    .matchedGeometryEffect(id: "backgroundRect",
                                           in: namespace)
            } else {
                Spacer()
                
                Rectangle()
                    .frame(width: 50, height: 25)
                    .cornerRadius(8)
                    .overlay(alignment: .center) {
                        Image(systemName: "chevron.up")
                            .foregroundColor(.white)
                            .onTapGesture {
                                withAnimation {
                                    self.showingCardPicker = true
                                }
                            }
                            .padding()
                    }
                    .offset(y: 5)
                    .shadow(radius: 5)
                    .matchedGeometryEffect(id: "backgroundRect",
                                           in: namespace)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder private func createGridCard(card: TarotCards) -> some View {
        VStack {
            // Card Image
            Image(card.tarotCard.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            // Card Name
            Text(card.tarotCard.name)
                .font(.footnote)
                .bold()
                .foregroundColor(.white)
        }
        .offset(x: cardState.width, y: cardState.height)
        .gesture(
            DragGesture()
                .onChanged { value in
                    withAnimation {
                        self.showingCardPicker = false
                    }
                    
                    cardState = value.translation
                }
        )
    }
}
