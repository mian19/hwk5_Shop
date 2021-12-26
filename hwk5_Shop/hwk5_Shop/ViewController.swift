//
//  ViewController.swift
//  hwk5_Shop
//
//  Created by Kyzu on 26.12.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goodsList: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create list of goods in the Shop
        let milk = Goods(name: "Молоко", price: 2.3, description: "Свежее молоко коровы")
        let salt = Goods(name: "Соль", price: 0.9, description: "Каменная соль")
        let cola = Goods(name: "Кока-Кола", price: 2.1, description: "Классическая кола")
        let bread = Goods(name: "Хлеб", price: 1, description: "Свежий черный хлеб")
        let meat = Goods(name: "Стейк", price: 8.1, description: "Свиная вырезка")
        ShopManager.shared.inTheShopGoods = [milk: 5, salt: 4, cola: 3, bread: 4, meat: 3]
        
        //display products on the section "Товар на полках"
        for (key, value) in ShopManager.shared.inTheShopGoods {
            goodsList.text! += "\(key.name) \(key.price)$\n"
            print (goodsList.text)
        }
        

    }


}

