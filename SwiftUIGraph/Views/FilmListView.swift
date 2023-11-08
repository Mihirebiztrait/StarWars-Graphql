//
//  FilmListView.swift
//  SwiftUIGraph
//
//  Created by Mihir vyas on 08/11/23.
//

import SwiftUI
import GetFimList

struct FilmListView: View {
    @StateObject var viewModel = FilmListViewModel()
    @State private var searchText = ""
    
    var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText, placeholder: "Search films")
                        .padding(.horizontal)
                    List(viewModel.filteredFilms(searchText), id: \.title) { film in
                        NavigationLink(destination: FilmDetailView(film: film)) {
                            HStack {
                                Text(film.title ?? "")
                            }
                        }
                    }
                    .listRowBackground(Color.white)
                    .navigationBarTitle("Star Wars Films")
                }
            }
            .padding()
            .background(Color.white)
            .onAppear {
                viewModel.loadStations()
            }
        }
    }

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}

//MARK: - Handle Film Names by Filter
extension FilmListViewModel {
    func filteredFilms(_ searchText: String) -> [GetAllFilmsQuery.Data.AllFilms.Film] {
        if searchText.isEmpty {
            return filmList
        } else {
            return filmList.filter { film in
                return film.title?.localizedCaseInsensitiveContains(searchText) ?? false
            }
        }
    }
}
