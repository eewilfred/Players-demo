//
//  PlayerDetailsView.swift
//  player-demo
//
//  Created by edwin wilson on 22/07/2023.
//

import SwiftUI
import Combine

struct PlayerDetailsView: View {
    
    @StateObject var viewModel:  PlayerDetailsViewModel
    @State var detailType: PlayerDetailType = .info
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.large)
                    .tint(Color("Primery"))
            }
            else {
                ZStack(alignment: .top) {
                    VStack(spacing: 0) {
                        PlayerDetailTopBarView(dismiss: dismiss)
                        ScrollView(.vertical) {
                            LazyVStack {
                                PlayerInformationView(model: viewModel)
                                PlayerInfoGlance(viewModel: viewModel)
                                    .padding(.top, 74)
                                TeamInfoView(viewModel: viewModel)
                                    .padding(.top,16)
                                PlayerDetailInfoSelectionView(type: $detailType)
                                    .padding(.top, 8)
                                    .padding(.leading, 13)
                                switch detailType {
                                case .info:
                                    playerDetailedinformationView()
                                case .statistics:
                                    PlayerStatisticsView()
                                case .event:
                                    PlayerEventsView()
                                case .media:
                                    PlayerMediaView()
                                }
                                
                            }
                        }
                        
                    }
                    GeometryReader { reader in
                        Color("Primery")
                            .frame(height: reader.safeAreaInsets.top, alignment: .top)
                            .ignoresSafeArea()
                    }
                }
            }
        }
        .environmentObject(viewModel)
    }
}

struct PlayerDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailsView(viewModel:  PlayerDetailsViewModel(slug: "hyz"))
    }
}
