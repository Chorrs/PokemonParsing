//
//  Pokemon.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import Foundation
struct PokemonApp: Decodable {
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct Character: Decodable {
    let sprites: Sprites
}

struct Sprites: Decodable {
    let other: Home
}

struct Home: Decodable {
    let  home: Front
}

struct Front: Decodable {
    let front_default: String
}
