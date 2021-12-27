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

//struct SpreadCard {
//    let id: UUID
//    let number: Int
//    var location: CGPoint
//    var meaning: String
//}

struct CreateSpreadTemplateView: View {
    @State private var counter: Int = 0
    
    var body: some View {
        ScrollView {
            HStack {
                Button(action: {
                    // Save Spread
                }) {
                    Image(systemName: "square.and.arrow.down")
                }
                
                Button(action: { self.counter += 1 }) {
                    Image(systemName: "plus")
                }
                .disabled(counter == 78 ? true : false)
            }
            .frame(maxWidth: .infinity,
                   alignment: .topTrailing)
            .zIndex(1)
            
            ForEach(0..<counter, id: \.self) { num in
                EmptyTarotCard(number: num + 1)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct EmptyTarotCard: View {
    @State var position: CGPoint = CGPoint(x: 50, y: 50)
    @State var rotationDegrees: Double = 0
    let number: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 74.75, height: 124.75)
            .shadow(radius: 5)
            .overlay(cardNumberOverlay)
            .rotationEffect(.degrees(rotationDegrees))
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.position = value.location
                    }
            )
            .contextMenu(menuItems: createContextMenu)
    }
    
    @ViewBuilder func createContextMenu() -> some View {
        Button {
            withAnimation(.linear(duration: 0.15)) {
                self.rotationDegrees -= 15
            }
        } label: {
            HStack {
                Text("Rotate 15° left")
                Image(systemName: "rotate.left.fill")
            }
        }
        
        Button {
            withAnimation(.linear(duration: 0.15)) {
                self.rotationDegrees += 15
            }
        } label: {
            HStack {
                Text("Rotate 15° right")
                Image(systemName: "rotate.right.fill")
            }
        }
        
        Button {
            withAnimation(.linear(duration: 0.15)) {
                self.rotationDegrees -= 90
            }
        } label: {
            HStack {
                Text("Rotate 90° left")
                Image(systemName: "rotate.left.fill")
            }
        }
        
        Button {
            withAnimation(.linear(duration: 0.15)) {
                self.rotationDegrees += 90
            }
        } label: {
            HStack {
                Text("Rotate 90° right")
                Image(systemName: "rotate.right.fill")
            }
        }
    }
    
    var cardNumberOverlay: some View {
        Text(String(number))
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.windowBackgroundColor))
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
