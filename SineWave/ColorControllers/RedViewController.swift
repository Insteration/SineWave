//
//  RedViewController.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    @IBOutlet weak var setButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton.layer.cornerRadius = 0.5 * setButton.bounds.size.width
        setButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setRedColor(_ sender: UIButton) {
        WaveStorage.wavesArray[0].color = .red
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
