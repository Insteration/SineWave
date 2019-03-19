//
//  WaveViewModel.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/18/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit



func getAtIndex(index: Int) -> Wave {
    return WaveStorage.wavesArray[index]
}

class WaveView {
    
    var myView = UIView()
    var centerY = 0.0
    var stepAxis_coordinates_X = 0.0
    var steps = 200
    let shapeLayer = CAShapeLayer()
    var timer: Timer!
    
    // MARK: - Setup
    
//    func createView(x: Int, y: Int, width: Int, height: Int) {
//
//    }
    
    func setup(x: Int, y: Int, width: Int, height: Int) {
        myView.frame = CGRect(x: x, y: y, width: width, height: height)
        myView.backgroundColor = .clear
        
        myView.layer.addSublayer(shapeLayer)
        
        centerY = Double(myView.frame.height) / 2
        stepAxis_coordinates_X = Double(myView.frame.width / CGFloat(steps))
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(onTimer(timer:)), userInfo: nil, repeats: true)
        
    }
 
    @objc func onTimer(timer: Timer) {
        drawSineWaves()
    }
    
    
    func drawSineWaves() {

        let sumPath = UIBezierPath()
        var sinSum = Array<CGFloat>(repeating: 0, count: steps)
        
        for i in 0..<WaveStorage.wavesArray.count {
            let path = UIBezierPath()
            let sine = getAtIndex(index: i)
            
            sine.timeWaveStep(timer: 0.2)
            
            let f = Double.pi * 2 / Double(steps) * sine.frequency
            
            for p in 0..<steps {
                let inc = Double(p)
                let x = inc * stepAxis_coordinates_X
                let y = sin((Double(p) * f) + sine.phase + sine.time) * sine.amplitude
                sinSum[p] += CGFloat(y)
                
                if p == 0 {
                    path.move(to: CGPoint(x: x, y: y + centerY))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y + centerY))
                }
            }
            
            sine.shapeLayer.path = path.cgPath
            myView.layer.addSublayer(sine.shapeLayer)
            sine.shapeLayer.lineWidth = 2
            sine.shapeLayer.fillColor = UIColor.clear.cgColor
            sine.shapeLayer.strokeColor = sine.color.cgColor
        }
        
        sumPath.move(to: CGPoint(x: 0, y:sinSum[0] + CGFloat(centerY)))
    }
}


