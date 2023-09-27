//
//  ViewController.swift
//  concurrentcy
//
//  Created by Cambrian on 2023-09-11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var meowfactsAPI: UIButton!
    
    @IBAction func meowfactsAPI(_ sender: Any) {
        
        Task {
                do {
                    let meowfactsResponse = try await MeowfactsAPI.fetchMeowfacts() // Call the Meowfacts API
                    // Print meow facts to the console
                    for (index, fact) in meowfactsResponse.data.enumerated() {
                        print("\(index): \(fact)")
                    }
                } catch MeowfactsAPIError.cannotConvertStringToURL {
                    print("Please insert a valid URL")
                } catch MeowfactsAPIError.networkError(let error) {
                    print("Network error: \(error)")
                } catch {
                    print(error)
                }
            }
    }
    
    @IBOutlet weak var geekJokeAPI: UIButton!
    
    @IBAction func geekJokeAPI(_ sender: Any) {
        Task {
                do {
                    let geekJokeResponse = try await GeekJokeAPI.fetchGeekJoke() // Call the Geek Joke API
                    // Print the geek joke to the console
                    print("Geek Joke: \(geekJokeResponse.joke)")
                } catch GeekJokeAPIError.cannotConvertStringToURL {
                    print("Please insert a valid URL")
                } catch GeekJokeAPIError.networkError(let error) {
                    print("Network error: \(error)")
                } catch {
                    print(error)
                }
            }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
}

