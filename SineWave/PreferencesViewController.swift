//
//  PreferencesViewController.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class PreferencesViewController: UITableViewController {
    
    @IBOutlet weak var frequrencySlider: UISlider!
    @IBOutlet weak var amplitudeSlider: UISlider!
    @IBOutlet weak var frequrencyLabel: UILabel!
    @IBOutlet weak var amplitudeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        frequrencySlider.value = Float(WaveStorage.wavesArray[0].frequency)
        frequrencyLabel.text = String(format: "%.2f", WaveStorage.wavesArray[0].frequency)
        
        amplitudeSlider.value = Float(WaveStorage.wavesArray[0].amplitude)
        amplitudeLabel.text = String(format: "%.2f", WaveStorage.wavesArray[0].amplitude)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func frequrencySliderAction(_ sender: UISlider) {
        WaveStorage.wavesArray[0].frequency = Double(frequrencySlider.value)
        frequrencyLabel.text = String(format: "%.2f", WaveStorage.wavesArray[0].frequency)
    }
    
    @IBAction func amplitudeSliderAction(_ sender: UISlider) {
        WaveStorage.wavesArray[0].amplitude = Double(amplitudeSlider.value)
        amplitudeLabel.text = String(format: "%.2f", WaveStorage.wavesArray[0].amplitude)

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
