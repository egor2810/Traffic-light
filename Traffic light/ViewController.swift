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
    
    private var colors: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUI()
    }
    
    private func settingUI() {
        colors = trafficLightStackView.subviews
        colors.forEach { $0.layer.cornerRadius = $0.layer.frame.width / 2}
        trafficLightButton.layer.cornerRadius = 15
    }
    
    @IBAction func toggleLightButton(_ sender: UIButton) {
        trafficLightButton.setTitle("Turn on the next light", for: .normal)

        guard let currentLightIndex = colors.firstIndex(where: {
            $0.alpha == 1
        }) else {
            colors[0].alpha = 1
            return
        }
        
        colors.forEach { $0.alpha = 0.3 }
        
        if currentLightIndex == colors.endIndex - 1 {
            colors[0].alpha = 1
        } else {
            colors[currentLightIndex + 1].alpha = 1
        }
    }
}

