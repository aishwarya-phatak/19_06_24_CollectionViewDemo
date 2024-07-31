//
//  DetailsViewController.swift
//  19_06_24_CollectionViewDemo
//
//  Created by Vishal Jagtap on 31/07/24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    var nameContanier : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        extractData()
    }
    
    private func extractData(){
        self.nameLabel.text = nameContanier
    }
}
