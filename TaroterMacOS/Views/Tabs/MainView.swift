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
    @State private var selectedTab: String = "Spread Template"
    @State private var spreadSearchText: String = ""
    let colors: [Color] = [Color.black.opacity(0), Color.black, Color.black, Color.black]
    
    var body: some View {
        GeometryReader { geom in
            HStack {
                // Side Bar
                ZStack {
                    BlurView()
                    
                    sideBarButtons
                    .mask(
                        LinearGradient(colors: colors,
                                       startPoint: .bottom,
                                       endPoint: .top)
                    )
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
                    case "Spread Template": CreateSpreadTemplateView()
                    default: CreateSpreadTemplateView()
                }
            }
        }
    }
    
    var sideBarButtons: some View {
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
                
                SideBarButton(title: "Spread Template",
                              systemImage: "rectangle.portrait.on.rectangle.portrait",
                              selectedTab: $selectedTab)
                
                SideBarButton(title: "Your Spreads",
                              systemImage: "person.text.rectangle.fill",
                              selectedTab: $selectedTab)
                
                Spacer()
            }
            .padding()
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

struct CreateSpreadTemplateView: View {
    @State private var cards: [SpreadCard] = []
    @State private var selectedTab: String = "My templates"
    @State private var showingSavingAlert: Bool = false
    
    var body: some View {
        ZStack {
            switch selectedTab {
                case "My templates": myTemplates
                case "New template": newTemplate
                default: EmptyView()
            }
            
            HStack(spacing: -10) {
                createPickerButton(title: "My templates")
                createPickerButton(title: "New template")
            }
            .frame(width: 250, height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
            .shadow(color: Color.primary.opacity(0.3), radius: 4)
            .disabled(showingSavingAlert ? true : false)
            
            if showingSavingAlert {
                VStack {
                    Text("Save Spread Template").bold()
                    Text("Please, fill the data below to save the spread template")
                    
                    TextField("Title",
                              text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Description").padding(.top)
                    TextEditor(text: .constant(""))
                        .cornerRadius(12)
                        .shadow(color: Color.primary.opacity(0.3), radius: 1, x: 0, y: 1)
                        .frame(maxHeight: 150)
                    
                    Divider()
                    
                    HStack {
                        Button(action: {}) {
                            Text("Done")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Divider()
                        
                        Button(action: {
                            withAnimation {
                                self.showingSavingAlert = false
                            }
                        }) {
                            Text("Cancel")
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.blue)
                    .buttonStyle(.plain)
                    .frame(height: 44)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(NSColor.windowBackgroundColor))
                        .shadow(radius: 2)
                )
                .padding()
                .transition(.scale(scale: 0.25, anchor: .center))
                .zIndex(1)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .zIndex(1)
    }
    
    var myTemplates: some View {
        Text("Hello world")
    }
    
    var newTemplate: some View {
        GeometryReader { geom in
            ScrollView {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.showingSavingAlert = true
                        }
                    }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .disabled(cards.isEmpty ? true : false)
                    
                    Button(action: {
                        let size = geom.size
                        let card = SpreadCard(id: UUID(),
                                              number: cards.count,
                                              location: CGPoint(x: size.width / 2,
                                                                y: size.height / 2),
                                              meaning: "")
                        
                        self.cards.append(card)
                    }) {
                        Image(systemName: "plus")
                    }
                    .disabled(cards.count == 78 ? true : false)
                }
                .disabled(showingSavingAlert ? true : false)
                .frame(maxWidth: .infinity,
                       alignment: .topTrailing)
                .zIndex(1)
                
                ZStack {
                    ForEach(cards.indices, id: \.self) { index in
                        EmptyTarotCard(card: cards[index],
                                       cards: $cards)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    @ViewBuilder func createPickerButton(title: String) -> some View {
        let isSelected = selectedTab == title
        
        Button(action: { withAnimation { selectedTab = title } }) {
            Text(title)
                .padding()
                .background(
                    Capsule()
                        .fill(isSelected ? Color(.windowBackgroundColor) : Color.gray)
                        .frame(height: 20)
                )
        }
        .buttonStyle(.plain)
        .zIndex(isSelected ? 2 : 0)
    }
}

struct EmptyTarotCard: View {
    @State var rotationDegrees: Double = 0
    @State var cardMeaning: String = ""
    @State var showingTextFieldAlert: Bool = false
    @State var card: SpreadCard
    @Binding var cards: [SpreadCard]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 74.75, height: 124.75)
                .shadow(radius: 5)
                .overlay(cardNumberOverlay)
                .rotationEffect(.degrees(rotationDegrees))
                .position(card.location)
                .gesture(DragGesture().onChanged { card.location = $0.location })
                .contextMenu(menuItems: createContextMenu)
                .id(card.id)
            
            if showingTextFieldAlert {
                TextFieldAlert(title: "Meaning",
                               message: "Add card number \(card.number + 1) meaning or question",
                               text: $cardMeaning,
                               isPresented: $showingTextFieldAlert) {
                    card.meaning = self.cardMeaning
                    withAnimation { self.showingTextFieldAlert = false }
                }
            }
        }
    }
    
    enum RotationButtonOperation {
        case addition
        case subtraction
    }
    
    @ViewBuilder func createRotationButton(degrees: Double, operation: RotationButtonOperation) -> some View {
        let isAddition: Bool  = operation == .addition
        let direction: String = isAddition ? "right" : "left"
        
        Button {
            withAnimation(.linear(duration: 0.15)) {
                if isAddition {
                    self.rotationDegrees += degrees
                } else {
                    self.rotationDegrees -= degrees
                }
            }
        } label: {
            Text("Rotate \(Int(degrees))° \(direction)")
            Image(systemName: isAddition ? "rotate.right.fill" : "rotate.left.fill")
        }
    }
    
    @ViewBuilder func createContextMenu() -> some View {
        Button {
            // Add Card Meaning
            withAnimation { self.showingTextFieldAlert = true }
        } label: {
            Text("Add meaning")
            Image(systemName: "plus")
        }
        
        // 15°
        createRotationButton(degrees: 15, operation: .subtraction)
        createRotationButton(degrees: 15, operation: .addition)
        
        // 45°
        createRotationButton(degrees: 45, operation: .subtraction)
        createRotationButton(degrees: 45, operation: .addition)
        
        // 90°
        createRotationButton(degrees: 90, operation: .subtraction)
        createRotationButton(degrees: 90, operation: .addition)
        
        Button {
            cards.remove(at: card.number)
        } label: {
            Text("Delete card")
            Image(systemName: "trash")
        }
    }
    
    var cardNumberOverlay: some View {
        Text(String(card.number + 1))
            .font(.largeTitle)
            .bold()
            .foregroundColor(Color(.windowBackgroundColor))
    }
}

//struct CreateSpreadView: View {
//    @Namespace var namespace
//    @State private var showingCardPicker: Bool = false
//    private let columns: [GridItem]            = [GridItem(.adaptive(minimum: 150))]
//    @State private var cardState: CGSize       = .zero
//
//    var body: some View {
//        VStack(alignment: .center) {
//            if showingCardPicker {
//                Rectangle()
//                    .overlay(alignment: .top) {
//                        VStack {
//                            Image(systemName: "chevron.down")
//                                .foregroundColor(.white)
//                                .onTapGesture {
//                                    withAnimation {
//                                        self.showingCardPicker = false
//                                    }
//                                }
//                                .padding()
//
//                            LazyVGrid(columns: columns) {
//                                ForEach(TarotCards.allCases,
//                                        id: \.self,
//                                        content: createGridCard)
//                            }
//                            .padding()
//                        }
//
//                    }
//                    .matchedGeometryEffect(id: "backgroundRect",
//                                           in: namespace)
//            } else {
//                Spacer()
//
//                Rectangle()
//                    .frame(width: 50, height: 25)
//                    .cornerRadius(8)
//                    .overlay(alignment: .center) {
//                        Image(systemName: "chevron.up")
//                            .foregroundColor(.white)
//                            .onTapGesture {
//                                withAnimation {
//                                    self.showingCardPicker = true
//                                }
//                            }
//                            .padding()
//                    }
//                    .offset(y: 5)
//                    .shadow(radius: 5)
//                    .matchedGeometryEffect(id: "backgroundRect",
//                                           in: namespace)
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//
//    @ViewBuilder private func createGridCard(card: TarotCards) -> some View {
//        VStack {
//            // Card Image
//            Image(card.tarotCard.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//
//            // Card Name
//            Text(card.tarotCard.name)
//                .font(.footnote)
//                .bold()
//                .foregroundColor(.white)
//        }
//        .offset(x: cardState.width, y: cardState.height)
//        .gesture(
//            DragGesture()
//                .onChanged { value in
//                    withAnimation {
//                        self.showingCardPicker = false
//                    }
//
//                    cardState = value.translation
//                }
//        )
//    }
//}
