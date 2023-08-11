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
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayPokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                
                let pokemon = arrayPokemon[indexPath.row]
                cell.textLabel?.text = "#\(pokemon.id) \(pokemon.name)"
                cell.detailTextLabel?.text = pokemon.url
                
                return cell
    }
}
