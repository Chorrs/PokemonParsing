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

//            NetworkingManager.shared.fetch(dataType: Character.self, url: pokemon.url) { (character: Character)
            NetworkingManager.shared.fetchCharacter(url: pokemon.url) { character in
                let imageUrl = character?.sprites.other.front.front_default
                
                NetworkingManager.shared.fetchImage(from: imageUrl ?? "") { data in
                    self.pokemonImageView.image = UIImage(data: data)
                }
            }
        }
    }

