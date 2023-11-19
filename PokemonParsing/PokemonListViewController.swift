//
//  ViewController.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import UIKit
import Alamofire

class PokemonListViewController: UITableViewController {
    var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemons()
    }

    private func fetchPokemons() {
//        NetworkingManager.shared.fetch(dataType: PokemonApp.self, url: List.url.rawValue) { (pokemonApp: PokemonApp) 
        NetworkingManager.shared.fetchPokemonApp(url: List.url.rawValue) { pokemonApp in
            self.pokemons = pokemonApp?.results ?? []
            self.tableView.reloadData()
        }
    }
}
