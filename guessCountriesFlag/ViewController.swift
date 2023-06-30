//
//  ViewController.swift
//  guessCountriesFlag
//
//  Created by Murat on 26.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameName.text = "Welcome Guess The Flag Game "
        gameImage.image = UIImage(named: "flagsmain")
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.width
        startButton.layer.cornerRadius = 0.5 * startButton.bounds.size.height
        startButton.clipsToBounds = true
    }
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameVC", sender: nil)
    }
    
    
}

