//
//  CreateSpreadTemplateView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

struct CreateSpreadTemplateView: View {
    @State private var cards: [SpreadCard] = []
    @State private var counter: Int = 0
    @State private var selectedTab: String = "My templates"
    @State private var showingSavingAlert: Bool = false
    @State private var spreadTitle: String = ""
    @State private var spreadDescription: String? = ""
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<SpreadTemplate>
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
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
                TextFieldAlert(title: "Save Spread Template",
                               message: "Please, fill the data below to save the spread template",
                               text: $spreadTitle,
                               spreadDescription: $spreadDescription,
                               isPresented: $showingSavingAlert,
                               alertType: .saving,
                               doneButtonAction: saveSpreadTemplate)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .zIndex(1)
    }
}

// MARK: - Methods
private extension CreateSpreadTemplateView {
    func addCard(windowSize: CGSize) {
        let card = SpreadCard(id: UUID(),
                              number: self.counter,
                              location: CGPoint(x: windowSize.width / 2,
                                                y: windowSize.height / 2),
                              meaning: "")
        
        self.cards.append(card)
        self.counter += 1
    }
}

// MARK: - Data Management
private extension CreateSpreadTemplateView {
    func saveSpreadTemplate() {
        withAnimation {
            let newTemplate = SpreadTemplate(context: viewContext)
            
            newTemplate.id = UUID()
            newTemplate.date = Date()
            newTemplate.title = spreadTitle
            newTemplate.spreadDescription = spreadDescription
            newTemplate.spreadCards = saveSpreadCards(from: self.cards)
        
            PersistenceController.shared.save()
            self.showingSavingAlert = false
            self.selectedTab = "My templates"
        }
    }
    
    func saveSpreadCards(from cards: [SpreadCard]) -> NSSet? {
        var cardsArray: [SpreadCards] = []
        
        for card in cards {
            let newCard = SpreadCards(context: viewContext)
            newCard.id = UUID()
            newCard.meaning = card.meaning
            newCard.number = Int32(card.number)
            newCard.xPosition = card.location.x
            newCard.yPosition = card.location.y
            
            cardsArray.append(newCard)
        }
        
        return NSSet(array: cardsArray)
    }
    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { cards[$0] }.forEach(viewContext.delete)
//            PersistenceController.shared.save()
//        }
//    }
}

// MARK: - Views
private extension CreateSpreadTemplateView {
    var myTemplates: some View {
        ScrollView {
            LazyVStack(spacing: 14) {
                ForEach(spreadTemplates, id: \.self) { template in
                    HStack {
                        Text(template.title ?? "").bold()
                        Spacer()
                        Text(dateFormatter.string(from: template.date ?? Date()))
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .padding(.top, 30)
    }
    
    var newTemplate: some View {
        GeometryReader { geom in
            ScrollView {
                // Buttons HStack
                HStack {
                    // Save Template Button
                    Button(action: { withAnimation { self.showingSavingAlert = true } }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .disabled(cards.isEmpty ? true : false)
                    
                    // Add Card Button
                    Button(action: { addCard(windowSize: geom.size) }) {
                        Image(systemName: "plus")
                    }
                    .disabled(cards.count == 78 ? true : false)
                }
                .disabled(showingSavingAlert ? true : false)
                .frame(maxWidth: .infinity,
                       alignment: .topTrailing)
                .zIndex(2)
                
                // Cards View
                ZStack {
                    ForEach(cards, id: \.self) { card in
                        EmptyTarotCard(card: card,
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
