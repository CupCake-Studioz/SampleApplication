//
//  ViewController1.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 21/05/21.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var lbTitleOutlet: UILabel!
    
    var centerTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lbTitleOutlet.text = centerTitle
        // Do any additional setup after loading the view.
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
