//
//  Wave.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/18/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//


import Foundation
import UIKit

class Wave {
    var amplitude: Double!
    var frequency: Double!
    var phase: Double = 0
    var time: Double = 0
    var color: UIColor!
    let shapeLayer = CAShapeLayer()
 
    init(frequency: Double, amplitude: Double, color: UIColor) {
        self.frequency = frequency
        self.amplitude = amplitude
        self.color = color
    }
 
    func timeWaveStep(timer: Double) {
        time += timer
    }
    
}

