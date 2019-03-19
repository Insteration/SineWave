//
//  ViewController.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/18/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var activityWave: UIActivityIndicatorView!
    
    var waveView = WaveView()
    var myView = UIView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityWave.startAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        myView = waveView.myView
        view.addSubview(myView)
        waveView.setup(x: 0, y: 0, width: Int(self.view.frame.size.width), height: (Int(self.view.frame.size.height)))
        
    }
}
