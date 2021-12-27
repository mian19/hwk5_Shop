//
//  ViewController.swift
//  hwk5_Shop
//
//  Created by Kyzu on 26.12.21.
//

import UIKit

class ViewController: UIViewController {

    //  @IBOutlet weak var goodsList: UILabel!
    @IBOutlet weak var buttonGoods1: UIButton!
    @IBOutlet weak var buttonGoods2: UIButton!
    @IBOutlet weak var buttonGoods3: UIButton!
    @IBOutlet weak var buttonGoods4: UIButton!
    @IBOutlet weak var buttonGoods5: UIButton!
    
    
    @IBOutlet weak var labelGoods1: UILabel!
    @IBOutlet weak var labelGoods2: UILabel!
    @IBOutlet weak var labelGoods3: UILabel!
    @IBOutlet weak var labelGoods4: UILabel!
    @IBOutlet weak var labelGoods5: UILabel!
    
    
    @IBOutlet weak var infoGoods1: UIButton!
    @IBOutlet weak var infoGoods2: UIButton!
    @IBOutlet weak var infoGoods3: UIButton!
    @IBOutlet weak var infoGoods4: UIButton!
    @IBOutlet weak var infoGoods5: UIButton!
    
    
    @IBOutlet weak var goodsInCart: UILabel!
    @IBOutlet weak var labelGoodsInCart: UILabel!
    
    var sumGoodsInCart: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: create list of goods in the Shop
        let milk = Goods(name: "Молоко", price: 2.3, description: "Свежее молоко коровы")
        let salt = Goods(name: "Соль", price: 0.9, description: "Каменная соль")
        let cola = Goods(name: "Кока-Кола", price: 2.1, description: "Классическая кола")
        let bread = Goods(name: "Хлеб", price: 1, description: "Свежий черный хлеб")
        let meat = Goods(name: "Стейк", price: 8.1, description: "Свиная вырезка")
        ShopManager.shared.inTheShopGoods = [milk: 5, salt: 4, cola: 3, bread: 4, meat: 39]
        
        let arrayOfButtonsGoods = [buttonGoods1, buttonGoods2, buttonGoods3, buttonGoods4, buttonGoods5]
        let arrayOfLabelsGoods = [labelGoods1, labelGoods2, labelGoods3, labelGoods4, labelGoods5]
        
        //MARK: display products on the section "Товар на полках"
        var i = 0
        for (key, _) in ShopManager.shared.inTheShopGoods {
            arrayOfButtonsGoods[i]?.setTitle(key.name, for: .normal)
            arrayOfLabelsGoods[i]?.text = String(key.price)
            i += 1
       }
    }
    
    //MARK: add goods from Shelf to Cart
    func addGoodsInCart (_ sender: UIButton) {
        print( sender.titleLabel!.text!)
        var currentGoods : Goods {
            var returnGoods : Goods? = nil
            for (key, _) in ShopManager.shared.inTheShopGoods {
                if key.name == sender.titleLabel!.text! {
                    returnGoods = key
                }
            }
            return returnGoods!
        }
        
        if ShopManager.shared.inTheShopGoods[currentGoods]! > 0 {
            
            if ShopManager.shared.inTheCart[currentGoods] == nil {
                ShopManager.shared.inTheCart[currentGoods] = 1
            } else {
                ShopManager.shared.inTheCart[currentGoods]! += 1
                
            }
            ShopManager.shared.inTheShopGoods[currentGoods]! -= 1
            sumGoodsInCart += currentGoods.price
            labelGoodsInCart.text = String(Double(round(sumGoodsInCart*100)/100))
            goodsInCart.text = ""
            for (key, value) in ShopManager.shared.inTheCart {
                goodsInCart.text! += "\(key.name) \(value) \n"
            }
            
        
        } else {
           //MARK: ALERT. if goods is end on Shelf
            print ("Товар на полке закончился! Надо заказать на складе")
            
        }
    }
    
    @IBAction func goods1ToCart(_ sender: UIButton) {
        addGoodsInCart(sender)
    }
    
    @IBAction func goods2ToCart(_ sender: UIButton) {
        addGoodsInCart(sender)
    }
    
    @IBAction func goods3ToCart(_ sender: UIButton) {
        addGoodsInCart(sender)
    }
    
    @IBAction func goods4ToCart(_ sender: UIButton) {
        addGoodsInCart(sender)
    }
    
    @IBAction func goods5ToCart(_ sender: UIButton) {
        addGoodsInCart(sender)
    }
    

    
    
    
}

