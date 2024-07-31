//
//  FoodItemsCollectionViewController.swift
//  19_06_24_CollectionViewDemo
//
//  Created by Vishal Jagtap on 26/07/24.
//

import UIKit

class FoodItemsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    private let reuseIdentifierForCollectionViewCell = "FoodItemsCollectionViewCell"
    var foodItems = ["Upma", "Poha", "samosa", "vadapav", "bhaji"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXIBWithTableView()
    }
    
    private func registerXIBWithTableView(){
        let uiNib = UINib(nibName: reuseIdentifierForCollectionViewCell, bundle: nil)
        self.collectionView.register(uiNib, forCellWithReuseIdentifier: reuseIdentifierForCollectionViewCell)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let foodItemCollectionViewCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForCollectionViewCell, for: indexPath) as! FoodItemsCollectionViewCell
        
        foodItemCollectionViewCell.foodItemLabel.text = foodItems[indexPath.item]
        foodItemCollectionViewCell.layer.cornerRadius = 40.0
        foodItemCollectionViewCell.layer.borderColor = CGColor(
            red: 100.0,
            green: 0.0,
            blue: 100.0,
            alpha: 5.0)
        foodItemCollectionViewCell.layer.borderWidth = 5.0
        foodItemCollectionViewCell.backgroundColor = .orange
        foodItemCollectionViewCell.backgroundView = UIImageView(image: UIImage(named: "cityIcon"))
        return foodItemCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = self.collectionView.frame.width
        let cellWidth = collectionViewWidth/3.0
        
        print(cellWidth)
        
        return CGSize(width: Int(cellWidth), height: Int(cellWidth))
    }
    
}
