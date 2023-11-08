// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GetFimList.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GetFimList.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GetFimList.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GetFimList.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Root": return GetFimList.Objects.Root
    case "FilmsConnection": return GetFimList.Objects.FilmsConnection
    case "Film": return GetFimList.Objects.Film
    case "Species": return GetFimList.Objects.Species
    case "Planet": return GetFimList.Objects.Planet
    case "Person": return GetFimList.Objects.Person
    case "Starship": return GetFimList.Objects.Starship
    case "Vehicle": return GetFimList.Objects.Vehicle
    case "FilmSpeciesConnection": return GetFimList.Objects.FilmSpeciesConnection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
