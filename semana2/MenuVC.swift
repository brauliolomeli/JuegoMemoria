//
//  MenuVC.swift
//  semana2
//
//  Created by Braulio Lomeli on 18/10/15.
//  Copyright © 2015 Braulio Lomeli. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController:vc2x2 = segue.destinationViewController as! vc2x2
        if(segue.identifier == Optional("sg2")){
            viewController.numeroOpciones = 4
        }
        else if(segue.identifier == Optional("sg3")){
            viewController.numeroOpciones = 9
        }
        else if(segue.identifier == Optional("sg4")){
            viewController.numeroOpciones = 16
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
