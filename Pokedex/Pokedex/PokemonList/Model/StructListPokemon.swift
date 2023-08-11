//
//  StructListPokemon.swift
//  Pokedex
//
//  Created by Emanuel Morales on 10/08/23.
//

import Foundation

struct listPokemon : Decodable {
    let results : [Results]
}
struct Results : Decodable {
    let name : String
    let url : String
}
struct printPokemons {
    let id : Int
    let name : String
    let url : String
}
