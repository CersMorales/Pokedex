//
//  APISession.swift
//  Pokedex
//
//  Created by Emanuel Morales on 10/08/23.
//

import Foundation
 class APISession {
     var pokemonsLoad : [printPokemons] = []
    var URLBase = "https://pokeapi.co/api/v2/pokemon"
    let limitePokemon = "?limit=1010"
     func getListPokemon(){
        let url = URL(string: "\(URLBase)\(limitePokemon)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            return
            }
            if let datos = data {
                do {
                    let decodable = JSONDecoder()
                    let pokemonsLista = try decodable.decode(listPokemon.self, from: datos)
                    let decodificado = pokemonsLista.results
                    var contador = 0
                    for pokemon in decodificado{
                         contador += 1
                        let IDPokemon = contador
                        let pokemonResult = pokemon.name
                        let pokemonURL = pokemon.url
                        let pokemonData = printPokemons(id: IDPokemon, name: pokemonResult, url: pokemonURL)
                        self.pokemonsLoad.append(pokemonData)
                    }
                } catch {
                    print("Error al decodificar JSON: \(error)")
                }
                print("\(self.pokemonsLoad)")
            }
        }
       session.resume()
    }
     func getImagePokemon (){
         for i in 1...1010{
             print("\(i)")
         }
     }
}
