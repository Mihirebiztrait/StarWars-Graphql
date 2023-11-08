//
//  Network.swift
//  SwiftUIGraph
//
//  Created by Mihir vyas on 08/11/23.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

  private init() {}

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}
