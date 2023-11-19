//
//  Pokemon.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import Foundation
struct PokemonApp {
    let results: [Pokemon]

    init?(json: [String: Any]) {
        guard let resultsJSON = json["results"] as? [[String: Any]] else {
            return nil
        }

        self.results = resultsJSON.compactMap { Pokemon(json: $0) }
    }
}


struct Pokemon {
    let name: String
    let url: String

    init?(json: [String: Any]) {
        guard let name = json["name"] as? String,
              let url = json["url"] as? String else {
            return nil
        }

        self.name = name
        self.url = url
    }
}

struct Character {
    let sprites: Sprites

    init?(json: [String: Any]) {
        guard let spritesJSON = json["sprites"] as? [String: Any],
              let sprites = Sprites(json: spritesJSON) else {
            return nil
        }

        self.sprites = sprites
    }
}

struct Sprites {
    let other: Home

    init?(json: [String: Any]) {
        guard let otherJSON = json["other"] as? [String: Any],
              let other = Home(json: otherJSON) else {
            return nil
        }

        self.other = other
    }
}

struct Home {
    let front: Front

    init?(json: [String: Any]) {
        guard let frontJSON = json["home"] as? [String: Any],
              let front = Front(json: frontJSON) else {
            return nil
        }

        self.front = front
    }
}

struct Front {
    let front_default: String

    init?(json: [String: Any]) {
        guard let front_default = json["front_default"] as? String else {
            return nil 
        }

        self.front_default = front_default
    }
}
