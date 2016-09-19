//
//  InterfaceController.swift
//  WatchKitBsp WatchKit Extension
//
//  Created by Christian Bleske on 07.01.15.
//  Copyright (c) 2015 Christian Bleske. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var uiLabel: WKInterfaceLabel!
    
    var timer:Timer?
    
    let zitate = ["Heimisch in der Welt wird man nur durch Arbeit. Wer nicht arbeitet, ist heimatlos. - Berthold Auerbach",
        "Gib blind, nimm sehend. - Dt. Sprichwort", "Die kürzesten Wörter, nämlich 'ja' und 'nein' erfordern das meiste Nachdenken. - Pythagoras von Samos", "Es gehört oft mehr Mut dazu, seine Meinung zu ändern, als ihr treu zu bleiben. - Friedrich Hebbel"]

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    @IBAction func btnPressed() {
        updateZitat()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        updateZitat()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(InterfaceController.updateZitat), userInfo: nil, repeats: true)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func getRandomNumber(_ min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func updateZitat() {
        let rnd = getRandomNumber(0, max: 3)
        self.uiLabel.setText(zitate[rnd])
    }


}
