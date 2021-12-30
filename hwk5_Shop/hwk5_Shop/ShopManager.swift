//
//  ShopManager.swift
//  hwk5_Shop
//
//  Created by Kyzu on 26.12.21.
//

import Foundation



//Создать магазин по продаже некоего товара. Приложение с одним экраном, на котором будут разные UI элементы
//1. Создать струтуру данных товара, которые будут содержать некоторые свойства, например, название, описание, цену, и т.д.
//2. Реализовать менеджер синглтон, в котором будут реализованы функции
//закупить товар,
//продать товар,
//подсчитать доход от продаж
//3. Реализовать UI с помощью различных элементов, например, кнопки купить/продать, отображение прибыли и т.д.



class ShopManager {
    static let shared = ShopManager()
    
    var inTheShopGoods: [Goods : Int] = [:]
    lazy var inTheCart: [Goods : Int] = [:]
    lazy var allSoldGoods: [Goods : Int] = [:]
    lazy var income: Double = 0
    lazy var countOfSells: Int = 0
    //
    func sellGoods(_ sumGoodsInCart: Double) {
        countOfSells += 1
        ShopManager.shared.income += sumGoodsInCart
    }
    
    //закупить товар
    
    
    //statistic of sold goods
    
    func addGoodsIntoStatistic() {
        for (key, _) in ShopManager.shared.inTheCart {
            if ShopManager.shared.allSoldGoods[key] == nil {
                ShopManager.shared.allSoldGoods[key] = ShopManager.shared.inTheCart[key]!
            } else {
                ShopManager.shared.allSoldGoods[key]! += ShopManager.shared.inTheCart[key]!
            }
        }
        ShopManager.shared.inTheCart.removeAll()
    }
    
}
