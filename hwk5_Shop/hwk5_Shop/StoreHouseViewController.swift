//
//  StoreHouseViewController.swift
//  hwk5_Shop
//
//  Created by Kyzu on 30.12.21.
//

import UIKit

class StoreHouseViewController: UIViewController {

    @IBOutlet weak var labelGoods1: UILabel!
    @IBOutlet weak var labelGoods2: UILabel!
    @IBOutlet weak var labelGoods3: UILabel!
    @IBOutlet weak var labelGoods4: UILabel!
    @IBOutlet weak var labelGoods5: UILabel!
    
    
    @IBOutlet weak var labelGoodsCount1: UILabel!
    @IBOutlet weak var labelGoodsCount2: UILabel!
    @IBOutlet weak var labelGoodsCount3: UILabel!
    @IBOutlet weak var labelGoodsCount4: UILabel!
    @IBOutlet weak var labelGoodsCount5: UILabel!
    
    
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var stepper2: UIStepper!
    @IBOutlet weak var stepper3: UIStepper!
    @IBOutlet weak var stepper4: UIStepper!
    @IBOutlet weak var stepper5: UIStepper!
    
    func arrayOfLabelsGoods() -> [UILabel] {
        return [labelGoods1, labelGoods2, labelGoods3, labelGoods4, labelGoods5]
        
    }
    func arrayOfLabelsGoodsCount() -> [UILabel] {
        [labelGoodsCount1, labelGoodsCount2, labelGoodsCount3, labelGoodsCount4, labelGoodsCount5]
    }
    
    func steppers() -> [UIStepper] {
        [stepper1, stepper2, stepper3, stepper4, stepper5]    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let steppers = steppers()
        
        for stepper in steppers {
            stepper.minimumValue = 0
            stepper.maximumValue = 30
            stepper.wraps = true
            stepper.autorepeat = true
        }
        
        let arrayOfLabelsGoods = arrayOfLabelsGoods()
        
        var i = 0
        for (key, _) in ShopManager.shared.inTheShopGoods {
            ShopManager.shared.inTheStoreHouse[key] = 0
            arrayOfLabelsGoods[i].text = key.name
            i += 1
        }
    }
    
    
    @IBAction func stepperChange1(_ sender: UIStepper) {
        labelGoodsCount1.text = Int(stepper1.value).description
    }
    
    @IBAction func stepperChange2(_ sender: UIStepper) {
        labelGoodsCount2.text = Int(stepper2.value).description
    }
    
    @IBAction func stepperChange3(_ sender: UIStepper) {
        labelGoodsCount3.text = Int(stepper3.value).description
    }
    
    @IBAction func stepperChange4(_ sender: UIStepper) {
        labelGoodsCount4.text = Int(stepper4.value).description
    }
    
    @IBAction func stepperChange5(_ sender: UIStepper) {
        labelGoodsCount5.text = Int(stepper5.value).description
    }
    
    //MARK: Send goods to Shop
    @IBAction func sendGoodsToShop(_ sender: UIButton) {
        
        let arrayOfLabelsGoodsCount = arrayOfLabelsGoodsCount()
        let arrayOfLabels = arrayOfLabelsGoods()
        var i = 0
        
        for elem in arrayOfLabels{
            
            for (key, _) in ShopManager.shared.inTheStoreHouse where key.name == elem.text {
                ShopManager.shared.inTheStoreHouse[key] = Int(arrayOfLabelsGoodsCount[i].text!)!
                break
            }
            i += 1
        }
        
        ShopManager.shared.orderGoodsFromStoreHouse()
        
        ShopManager.shared.inTheStoreHouse.keys.forEach {ShopManager.shared.inTheStoreHouse[$0] = 0}
        
        let steppers = steppers()
        
        for   elem in   arrayOfLabelsGoodsCount {
            elem.text = "0"
        }
        for stepper in steppers {
            stepper.value = 0
        }
        
        let alert = UIAlertController(title: "Товар отправлен в магазин!", message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default, handler: nil)
        let toShopButton = UIAlertAction(title: "В магазин", style: .destructive) {_ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okButton)
        alert.addAction(toShopButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    //MARK: go to main page
    
    @IBAction func goToMainPage(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
