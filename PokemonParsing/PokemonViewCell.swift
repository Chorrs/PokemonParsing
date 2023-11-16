//
//  PokemonViewCellTableViewCell.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import UIKit

class PokemonViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    func configure(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        NetworkingManager.shared.fetch(dataType: Character.self, url: pokemon.url) { character in
            NetworkingManager.shared.fetchImage(from: character.sprites.other.home.front_default) { data in
                self.pokemonImageView.image = UIImage(data: data)
            }
            
        }
    }
}
