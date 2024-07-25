//
//  ViewController.swift
//  19_06_24_CollectionViewDemo
//
//  Created by Vishal Jagtap on 25/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var studentCollectionView: UICollectionView!
    private let reuseIdentifierForCollectionViewCell = "StudentCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        registerXIBWithTableView()
    }
    
    private func registerXIBWithTableView(){
        let uiNIb = UINib(nibName: reuseIdentifierForCollectionViewCell, bundle: nil)
        self.studentCollectionView.register(uiNIb, forCellWithReuseIdentifier: reuseIdentifierForCollectionViewCell)
    }

    private func initViews(){
        studentCollectionView.delegate = self
        studentCollectionView.dataSource = self
    }

}

extension ViewController : UICollectionViewDataSource{
    
    //optional method
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //mandatory methods
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForCollectionViewCell, for: indexPath) as! StudentCollectionViewCell
        
        studentCollectionViewCell.studentImageView.image = UIImage(named: "cityIcon")
        studentCollectionViewCell.backgroundColor = .orange
        return studentCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

extension ViewController : UICollectionViewDelegate{
    
}


extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfCollectionView = self.studentCollectionView.frame.width
        let heightOfCollectionView = self.studentCollectionView.frame.height
        
        print("Width of collection view -- \(widthOfCollectionView)")
        print("Height of collection view -- \(heightOfCollectionView)")
        
        let widthOfItem = widthOfCollectionView/4.0
        
        print("Width of Item -- \(widthOfItem)")
        let sizeOfItem = CGSize(width: Int(widthOfItem), height: Int(widthOfItem))
        
        return sizeOfItem
    }
}
