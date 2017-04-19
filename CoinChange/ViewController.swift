//
//  ViewController.swift
//  CoinChange
//
//  Created by Michelline Tran on 4/11/17.
//  Copyright © 2017 MichellineTran. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {

    private let cellIdentifier = "COIN_CELL"
    
    @IBOutlet weak var coinCollectionView: UICollectionView!
   
    
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CoinCollectionViewCell", bundle: nil)
        
        coinCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        coinCollectionView.dataSource = self
        coinCollectionView.delegate = self
        
        valueTextField.delegate = self
        
    }
    
    var numberOfCoins: Int = 0
    
    
    var currentChangeSet = ChangeSet(quarters: 0, dimes: 0, nickels: 0, pennies: 0)
    
  
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return Int(currentChangeSet.quarters)
        }
        if section == 1 {
            return Int(currentChangeSet.dimes)
        }
        if section == 2 {
            return Int(currentChangeSet.nickels)
        }
        if section == 3 {
            return Int(currentChangeSet.pennies)
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CoinCollectionViewCell
        
        if indexPath.section == 0 {
            cell.coinImageView.image = #imageLiteral(resourceName: "Quarter")
        }
        
        if indexPath.section == 1 {
            cell.coinImageView.image = #imageLiteral(resourceName: "Dime")
        }
        
        if indexPath.section == 2 {
            cell.coinImageView.image = #imageLiteral(resourceName: "Nickel")
        }
        
        if indexPath.section == 3 {
            cell.coinImageView.image = #imageLiteral(resourceName: "Penny")
        }
        
        return cell
        
    }

    // MARK: UICollectionViewLayout
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        convert()
    }
    
    
    func convert() {
        guard let text = valueTextField.text else {
            return
        }
        
        guard let textToUInt = UInt(text) else {
            
            let alert = UIAlertController(title: "Gimme Coins!", message: "Please enter a valid number of coins to convert.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default, handler: nil))
            
            alert.view.tintColor = UIColor(colorLiteralRed: 163.0/255.0, green: 30.0/255.0, blue: 23.0/255.0, alpha: 1.0)
            self.present(alert, animated: true, completion: nil)
            
            valueTextField.text = ""
            
            return
        }
        
        let coinChangeConverter = CoinChangeConverter()
        currentChangeSet = coinChangeConverter.convertToChange(value: textToUInt)
        
        coinCollectionView.reloadData()
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        convert()
        return true
    }
 
    
    
}



