//
//  StructData.swift
//  Pokedex
//
//  Created by Emanuel Morales on 10/08/23.
//

import Foundation
struct pokemonSelected : Decodable{
    let abilities : [abilities]
    let name : String
    let base_experience: Int
    let height : Int
    let weight : Int
}
struct abilities : Decodable {
    let ability: Ability
    struct Ability: Codable {
           let name: String
           let url: String
    }
}
