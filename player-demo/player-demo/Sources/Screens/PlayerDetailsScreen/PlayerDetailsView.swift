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
                                /* View Model Passing can be avoided as shown for
                                  the Last two views. But as i have not implemented a
                                 factory to create models i am keeping it as is for
                                 simiplicity.
                                */
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
                                    playerDetailedinformationView(viewModel: viewModel)
                                case .statistics:
                                    PlayerStatisticsView(viewModel: viewModel)
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

