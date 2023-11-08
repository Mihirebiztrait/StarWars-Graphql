//
//  FilmListViewModel.swift
//  SwiftUIGraph
//
//  Created by Mihir vyas on 08/11/23.
//

import Foundation
import Apollo
import GetFimList

@MainActor
final class FilmListViewModel: ObservableObject {
    
    @Published var filmList: [GetAllFilmsQuery.Data.AllFilms.Film] = []
    func loadStations() {
            Network.shared.apollo.fetch(query: GetAllFilmsQuery()) { [weak self] result in
                guard let self = self else {
                    return
                }
                
                switch result {
                    
                case .success(let graphQLResult):
                    // check the `data` property
                    if let filmConnection = graphQLResult.data?.allFilms?.films {
                        self.filmList.append(contentsOf: filmConnection.compactMap({ $0 }))
                    }
                    print(self.filmList)
                    for i in self.filmList{
                        print(i.title)
                    }
                    
                    if let errors = graphQLResult.errors {
                        print(errors)
                    }
                    
                case .failure(let error):
                    print(error)
                }
                
            }
        }
}
