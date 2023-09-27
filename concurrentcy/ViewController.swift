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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }


}

