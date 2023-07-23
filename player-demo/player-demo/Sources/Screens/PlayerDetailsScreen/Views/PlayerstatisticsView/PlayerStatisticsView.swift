//
//  PlayerStatisticsView.swift
//  player-demo
//
//  Created by edwin wilson on 23/07/2023.
//

import SwiftUI

@MainActor struct PlayerStatisticsViewModel {
    
    var statisitcs: [Statistic] = []
    var leagues: [String] = []
    
    func statisitFor(league: String) -> Statistic? {
        if let index = self.leagues.firstIndex(of: league) {
            return statisitcs[index]
        }
        return nil
    }
    
    init(viewModel: PlayerDetailsViewModel) {
        guard let model = viewModel.details else { return }
        
        self.statisitcs = model.statistics
        self.leagues = self.statisitcs.map({$0.league}) // to show seelction button
        
    }
}

@MainActor struct PlayerStatisticsView: View {
    
    var model: PlayerStatisticsViewModel
    @State var selectedtype: String = ""
    
    init(viewModel: PlayerDetailsViewModel) {
        self.model = PlayerStatisticsViewModel(viewModel: viewModel)
    }
    
    var body: some View {
        PlayerStatisticsTypeSelector(selectedType: $selectedtype, leagues: model.leagues)
            .frame(height: 40)
            .onAppear(perform: {
                selectedtype = model.leagues.first ?? ""
            })
        if let statistic = model.statisitFor(league: selectedtype) {
            PlayerStatisticsDetailsView(
                model: PlayerStatisticsDetailsViewModel(
                    statistic: statistic
                )
            )
        }
        
    }
}

fileprivate struct PlayerStatisticsTypeSelector: View {
    
    @Binding var selectedType: String
    var leagues: [String]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(alignment: .center, spacing: 12) {
                
                ForEach(leagues, id: \.self) { league in
                    VStack {
                        HStack(alignment: .center, spacing: 4) {
                            Text(league)
                                .FontSFPro(
                                    15,
                                    .semibold,
                                    league == selectedType ? Color("Primery") :
                                        Color("Grey08")
                                )
                                .multilineTextAlignment(.center)
                                .padding(.leading, 16)
                                .padding(.trailing,16)
                        }
                        
                        if league == selectedType {
                            Color("Primery")
                                .frame(height: 3)
                        }
                    }
                    .onTapGesture {
                        selectedType = league
                    }
                }
            }
            .background(Color("Grey0"))
        }
    }
}

struct PlayerStatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerStatisticsView(viewModel: PlayerDetailsViewModel(slug: "xyz", useCase: PlayerListingUseCase(networkService: NetworkService(), imageService: ImageLoaderService())))
    }
}
