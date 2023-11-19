//
//  NetworkingFile.swift
//  PokemonParsing
//
//  Created by Chorrs on 15.11.23.
//

import Foundation
import Alamofire
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum List: String {
    case url = "https://pokeapi.co/api/v2/pokemon"
}

class NetworkingManager {
 static let shared = NetworkingManager()

func fetchPokemonApp(url: String, completion: @escaping (PokemonApp?) -> Void) {
            guard let url = URL(string: url) else { return }

            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    return
                }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let pokemonApp = PokemonApp(json: json) {
                        DispatchQueue.main.async {
                            completion(pokemonApp)
                        }
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }

    func fetchPokemon(url: String, completion: @escaping (Pokemon?) -> Void) {
            guard let url = URL(string: url) else { return }

            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    return
                }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let pokemon = Pokemon(json: json) {
                        DispatchQueue.main.async {
                            completion(pokemon)
                        }
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }
    
    func fetchCharacter(url: String, completion: @escaping (Character?) -> Void) {
           guard let url = URL(string: url) else { return }

           URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data else {
                   return
               }
               do {
                   if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let character = Character(json: json) {
                       DispatchQueue.main.async {
                           completion(character)
                       }
                   }
               } catch {
                   print(error)
               }
           }.resume()
       }

       func fetchSprites(url: String, completion: @escaping (Sprites?) -> Void) {
           guard let url = URL(string: url) else { return }

           URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data else {
                   return
               }
               do {
                   if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let sprites = Sprites(json: json) {
                       DispatchQueue.main.async {
                           completion(sprites)
                       }
                   }
               } catch {
                   print(error)
               }
           }.resume()
       }

    func fetchHome(url: String, completion: @escaping (Home?) -> Void) {
            guard let url = URL(string: url) else { return }

            URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data else {
                    return
                }
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let home = Home(json: json) {
                        DispatchQueue.main.async {
                            completion(home)
                        }
                    }
                } catch {
                    print(error)
                }
            }.resume()
        }


       func fetchFront(url: String, completion: @escaping (Front?) -> Void) {
           guard let url = URL(string: url) else { return }

           URLSession.shared.dataTask(with: url) { data, _, error in
               guard let data = data else {
                   return
               }
               do {
                   if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let front = Front(json: json) {
                       DispatchQueue.main.async {
                           completion(front)
                       }
                   }
               } catch {
                   print(error)
               }
           }.resume()
       }

    func fetchImage(from url: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: url) else { return }

        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    completion(imageData)
                }
            } catch {
                print(error)
            }
        }
    }
       private init() {}
   }



  


