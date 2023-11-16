//
//  ViewController.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import UIKit

class PokemonListViewController: UITableViewController {

    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPokemons()
    
    }
    private func fetchPokemons() {
        NetworkingManager.shared.fetch(dataType: PokemonApp.self, url: List.url.rawValue) { pokemonApp in
            self.pokemons = pokemonApp.results
            self.tableView.reloadData()
        }
    }
}
extension PokemonListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokemonViewCell else { return UITableViewCell() }
        
        let pokemon = pokemons[indexPath.row]
        cell.configure(pokemon: pokemon)
        return cell
    }
}

//let urlString = URL(string: "https://pokeapi.co/api/v2/pokemon")
//if let url = urlString {
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error)
//        if let error = error {
//            print("DataTas error:" + "\(error.localizedDescription)" + "\n")
//        } else if let usableData = data,
//                  let response = response as? HTTPURLResponse,
//                  response.statusCode == 200 {
//            print(usableData)
//        }
//    }
//}
//task.resume()
