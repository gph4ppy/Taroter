//
//  CreateSpreadTemplateView.swift
//  TaroterMacOS
//
//  Created by Jakub Dąbrowski on 30/12/2021.
//

import SwiftUI

struct CreateSpreadTemplateView: View {
    @State private var cards: [SpreadCard]        = []
    @State private var selectedTab: SpreadTabs    = .savedTemplates
    @State private var showingSavingAlert: Bool   = false
    @State private var spreadTitle: String        = ""
    @State private var spreadDescription: String? = ""
    @State private var showingSpread: Bool        = false
    @State private var selectedSpread: SpreadTemplate?
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \SpreadTemplate.date, ascending: true)],
        animation: .default
    ) private var spreadTemplates: FetchedResults<SpreadTemplate>
    
    private let dateFormatter: DateFormatter      = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        ZStack {
            // View Switch
            switch selectedTab {
                case .savedTemplates: myTemplates
                case .newTemplate: newTemplate
                default: EmptyView()
            }
            
            // Segmented Custom Tab Picker
            HStack(spacing: -10) {
                // Saved Templates
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.savedTemplates.label,
                                      selectTabAction: selectTab)
                
                // New Template
                SegmentedPickerButton(selectedTab: $selectedTab,
                                      title: SpreadTabs.newTemplate.label,
                                      selectTabAction: selectTab)
            }
            .frame(width: 250, height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
            .shadow(color: Color.primary.opacity(0.3), radius: 4)
            .disabled(showingSavingAlert ? true : false)
            
            // TextField Alert
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
    }
}

// MARK: - Methods
private extension CreateSpreadTemplateView {
    /// This method appends a card with a number to the array
    /// so it can be displayed in the center of the view.
    /// - Parameter windowSize: View size that allows the startup positioning of the card
    ///                         (x = half-width and y = half-height).
    func addCard(windowSize: CGSize) {
        let card = SpreadCard(id: UUID(),
                              number: cards.count,
                              location: CGPoint(x: windowSize.width / 2,
                                                y: windowSize.height / 2),
                              meaning: "",
                              rotationDegrees: 0.0)
        
        self.cards.append(card)
    }
    
    func selectTab(title: String) -> SpreadTabs {
        switch title {
            case SpreadTabs.savedTemplates.label: return .savedTemplates
            case SpreadTabs.newTemplate.label: return .newTemplate
            default: return .savedTemplates
        }
    }
    
    func clearSpread() {
        withAnimation {
            self.cards.removeAll()
        }
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
            self.selectedTab = .savedTemplates
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
            newCard.rotationDegrees = card.rotationDegrees
            
            cardsArray.append(newCard)
        }
        
        return NSSet(array: cardsArray)
    }
    
    private func removeTemplate(template: SpreadTemplate) {
        withAnimation {
            viewContext.delete(template)
            PersistenceController.shared.save()
        }
    }
}

// MARK: - Views
private extension CreateSpreadTemplateView {
    var myTemplates: some View {
        ZStack {
            // Templates List
            ScrollView {
                LazyVStack(spacing: 14,
                           content: createTemplatesList)
            }
            .padding(.top, 30)
            
            // Saved Template
            if let spreadCards = selectedSpread?.spreadCards, showingSpread {
                SpreadTemplatePreview(showingSpread: $showingSpread,
                                      spreadCards: spreadCards)
            }
        }
    }
    
    @ViewBuilder func createTemplatesList() -> some View {
        ForEach(spreadTemplates, id: \.self) { template in
            HStack {
                Text(template.title ?? "").bold()
                Spacer()
                Text(dateFormatter.string(from: template.date ?? Date()))
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                
                Button(action: { removeTemplate(template: template) }) {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                }
            }
            .onTapGesture {
                withAnimation {
                    self.selectedSpread = template
                    self.showingSpread = true
                }
            }
        }
    }
    
    var newTemplate: some View {
        GeometryReader { geom in
            // Buttons HStack
            HStack {
                // Clear Button
                Button(action: clearSpread) {
                    Image(systemName: "xmark")
                }
                .disabled(cards.isEmpty ? true : false)
                
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
            .zIndex(1)
            
            // Cards View
            ZStack {
                ForEach(cards, id: \.self) { card in
                    EmptyTarotCard(card: card,
                                   cards: $cards,
                                   isEditable: true)
                }
            }
            
            Spacer()
        }
    }
}
