//
//  ViewController.swift
//  Traffic light
//
//  Created by Егор Аблогин on 02.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var trafficLightStackView: UIStackView!
    
    @IBOutlet weak var trafficLightButton: UIButton!
    
    private var colours: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuratingUI()
    }
    
    private func configuratingUI() {
        colours = trafficLightStackView.subviews
        colours.forEach { $0.layer.cornerRadius = $0.layer.frame.width / 2}
        trafficLightButton.layer.cornerRadius = 15
    }
    
    @IBAction func toggleLightButton(_ sender: UIButton) {
        trafficLightButton.setTitle("Turn on next light", for: .normal)
        
        let currentLightIndex = colours.firstIndex(where: { $0.alpha == 1 })
        
        colours.forEach { $0.alpha = 0.5 }
        
        if let currentLightIndex {
            if currentLightIndex == colours.count - 1 {
                colours[0].alpha = 1
            } else {
                colours[currentLightIndex + 1].alpha = 1
            }
        } else {
            colours[0].alpha = 1
        }
    }
}

