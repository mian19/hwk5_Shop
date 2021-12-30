//
//  ViewController.swift
//  hwk5_Shop
//
//  Created by Kyzu on 26.12.21.
//

import UIKit

class ViewController: UIViewController {

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
    
    @IBOutlet weak var goodsInCart: UILabel!
    @IBOutlet weak var labelGoodsInCart: UILabel!
    @IBOutlet weak var cashRegisterTextView: UITextView!
    
    var sumGoodsInCart: Double = 0
    var orderCount: Int = 0
    let okButton = UIAlertAction(title: "OK", style: .default, handler: .none)
    
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
        
        cashRegisterTextView.isEditable = false
        
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
            let alertWhenGoodsEndOnShelf = UIAlertController(title: "Внимание!", message: "Товар \"\(currentGoods.name)\" закончился! Надо заказать на складе", preferredStyle: .alert)
            alertWhenGoodsEndOnShelf.addAction(okButton)
            self.present(alertWhenGoodsEndOnShelf, animated: true, completion: nil)
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
    
    //MARK: display info about goods
    
    func showGoodsInfo (_ sender : UILongPressGestureRecognizer) {
        
        let tappedButton: UIButton = sender.delegate as! UIButton
        
        var currentGoods : Goods {
            var returnGoods : Goods? = nil
            for (key, _) in ShopManager.shared.inTheShopGoods {
                if key.name == tappedButton.titleLabel!.text! {
                    returnGoods = key
                }
            }
            return returnGoods!
        }
        
        if sender.state == .began {
            let alert = UIAlertController(title: "\(tappedButton.titleLabel!.text!)", message: "Цена товара: \(currentGoods.price) BYN \n Описание: \(currentGoods.description) \n На полках осталось: \(ShopManager.shared.inTheShopGoods[currentGoods]!)", preferredStyle: .alert)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: .none)
        }
    }
    
    @IBAction func longTapButtonGoods1(_ sender: UILongPressGestureRecognizer) {
        showGoodsInfo(sender)
    }
    
    @IBAction func longTapButtonGoods2(_ sender: UILongPressGestureRecognizer) {
        showGoodsInfo(sender)
    }
    
    @IBAction func longTapButtonGoods3(_ sender: UILongPressGestureRecognizer) {
        showGoodsInfo(sender)
    }
    
    @IBAction func longTapButtonGoods4(_ sender: UILongPressGestureRecognizer) {
        showGoodsInfo(sender)
    }
    
    @IBAction func longTapButtonGoods5(_ sender: UILongPressGestureRecognizer) {
        showGoodsInfo(sender)
    }
    
    //MARK: remove Goods from Cart
    
    @IBAction func removeGoodsFromCart(_ sender: UIButton) {
        if ShopManager.shared.inTheCart.isEmpty  {
            let alert = UIAlertController(title: "Корзина пуста!", message: "",  preferredStyle: .alert)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: .none)
        }
        
        for (key, _) in ShopManager.shared.inTheCart {
            if ShopManager.shared.inTheShopGoods[key] != nil {
                ShopManager.shared.inTheShopGoods[key]! += ShopManager.shared.inTheCart[key]!
            }
        }
        ShopManager.shared.inTheCart.removeAll()
        goodsInCart.text! = "товар не выбран"
        sumGoodsInCart = 0
        labelGoodsInCart.text = "0"
    }
    
    //MARK: sell goods in Cart
    @IBAction func sellGoodsInCart(_ sender: UIButton) {
        //если корзина пустая - алерт заполни корзину
        // если в корзине есть товар - добавить товар с лэйбла в textview добавить продукты в словарь всего продано, увеличить счетчик заказа, вывести на экран, очисть корзину и очистить лэйбу
        if ShopManager.shared.inTheCart.isEmpty  {
            let alert = UIAlertController(title: "Сначала добавьте товар в корзину!", message: "",  preferredStyle: .alert)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: .none)
        } else {
            ShopManager.shared.sellGoods(sumGoodsInCart)
            cashRegisterTextView.text += "Заказ №\(ShopManager.shared.countOfSells) \n\n" + goodsInCart.text! + "ИТОГО: " + labelGoodsInCart.text! + " BYN\n" + "-------------------------\n"
            cashRegisterTextView.scrollRangeToVisible(NSMakeRange(cashRegisterTextView.text.count-1, 1))
            
            //add goods in sales statistic
            ShopManager.shared.addGoodsIntoStatistic()
            goodsInCart.text! = "товар не выбран"
            sumGoodsInCart = 0
            labelGoodsInCart.text = "0"
        }
    }
    
    //MARK: ordergoods from the storehouse
    
    
    //MARK: show saless statistic
    @IBAction func showIncomeInfo(_ sender: UIButton) {
        var countSoldGoods = ""
        for (key, value) in ShopManager.shared.allSoldGoods {
            countSoldGoods += "\(key.name) \(value) \n"
        }
        
        cashRegisterTextView.text += "Заказов оформлено:\(ShopManager.shared.countOfSells) \n" +  countSoldGoods  + "Общий доход: \(ShopManager.shared.income)" + " BYN\n" + "-------------------------\n"
        cashRegisterTextView.scrollRangeToVisible(NSMakeRange(cashRegisterTextView.text.count-1, 1))
    }
    
    
    
}
    


