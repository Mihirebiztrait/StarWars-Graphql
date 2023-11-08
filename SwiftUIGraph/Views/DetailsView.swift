//
//  DetailsView.swift
//  SwiftUIGraph
//
//  Created by Mihir vyas on 08/11/23.
//

import SwiftUI
import GetFimList

//MARK: - DetailsView
struct FilmDetailView: View {
    let film: GetAllFilmsQuery.Data.AllFilms.Film // Assuming you have a Film struct
    
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
            VStack(alignment: .leading, spacing: 5) {
                Text(film.title ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 60)
                Text("Directed by: \(film.director ?? "")")
                    .font(.headline)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 30)
                GeometryReader { geometry in
                    ScrollView {
                        VStack {
                            if let speciesValue = film.speciesConnection?.species {
                                ForEach(speciesValue, id: \.?.name) { species in
                                    Text(species?.name ?? "")
                                        .font(.headline)
                                        .padding(.top, 5)
                                }
                            }
                        }
                        .offset(y: scrollOffset)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(Animation.linear(duration: 10).repeatForever(autoreverses: false)) {
                                self.scrollOffset = -geometry.size.height
                            }
                        }
                        }
                    }
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.5)
                        .offset(x: (geometry.size.width - (geometry.size.width * 0.8)) / 2)
                    .mask(
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.black, .black, .clear, .clear]), startPoint: .top, endPoint: .bottom))
                    )
                }

                Spacer()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
