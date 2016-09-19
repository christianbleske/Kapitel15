//
//  ViewController.swift
//  WatchKitBsp
//
//  Created by Christian Bleske on 07.01.15.
//  Copyright (c) 2015 Christian Bleske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer?
    
    let zitate = ["Heimisch in der Welt wird man nur durch Arbeit. Wer nicht arbeitet, ist heimatlos. - Berthold Auerbach",
        "Gib blind, nimm sehend. - Dt. Sprichwort", "Die kürzesten Wörter, nämlich 'ja' und 'nein' erfordern das meiste Nachdenken. - Pythagoras von Samos", "Es gehört oft mehr Mut dazu, seine Meinung zu ändern, als ihr treu zu bleiben. - Friedrich Hebbel"]
    
    @IBOutlet var uiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateZitat()
         timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.updateZitat), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getRandomNumber(_ min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func updateZitat() {
        let rnd = getRandomNumber(0, max: 3)
        self.uiLabel.text = zitate[rnd]
    }
    
    

}

