//
//  ListView.swift
//  Pokedex
//
//  Created by Emanuel Morales on 10/08/23.
//

import UIKit

class ListView: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
    @IBOutlet weak var tableview: UITableView!
    var arrayPokemon: [printPokemons] = []
    private let listViewModel = APISession()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        listViewModel.getListPokemon()
        listViewModel.pokemonsLoad
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listViewModel.pokemonsLoad.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                
                let pokemon = listViewModel.pokemonsLoad[indexPath.row]
        Cell.textLabel?.text = "#\(pokemon.id)"
                Cell.detailTextLabel?.text = pokemon.name
        
                
                return Cell
    }
}
