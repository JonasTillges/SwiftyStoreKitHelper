//
//  ViewController.swift
//  IAPHelperDemo
//
//  Created by Jonas Tillges on 06.03.19.
//  Copyright © 2019 BEANT. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {
    
    let priceTag = UILabel()
    let productName = UILabel()
    let productDescription = UILabel()
    let subscriptionTermsText = UITextView()
    
    let buyButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 44/255, green: 57/255, blue: 95/255, alpha: 1)
        navigationItem.title = "IAPHelper Demo"
        navigationController?.navigationBar.barTintColor = UIColor(red: 217/255, green: 48/255, blue: 80/255, alpha: 1)
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupViews()
        
        //Get your Product Info
        IAPHelper.getProductInfo(with: IAPHelper.Product1, completed: {() -> () in
            self.priceTag.text = IAPHelper.Info[0].priceString
            self.productName.text = IAPHelper.Info[0].name
            self.productDescription.text = IAPHelper.Info[0].localizedDescription
        })
    }
    
    
    func setupViews() {
        view.addSubview(priceTag)
        view.addSubview(productName)
        view.addSubview(productDescription)
        view.addSubview(buyButton)
        view.addSubview(subscriptionTermsText)
        
        priceTag.center(in: view)
        productName.center(in: view, offset: CGPoint(x: 0, y: 40))
        productDescription.center(in: view, offset: CGPoint(x: 0, y: 80))
        
        buyButton.setTitle("Buy", for: .normal)
        buyButton.tintColor = .white
        buyButton.backgroundColor = UIColor(red: 11/255, green: 22/255, blue: 53/255, alpha: 1)
        buyButton.layer.cornerRadius = 10
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        buyButton.center(in: view, offset: CGPoint(x: 0, y: 140))
        buyButton.height(50)
        buyButton.width(100)
        
        subscriptionTermsText.tintColor = .white
        subscriptionTermsText.top(to: buyButton).constant = 80
        subscriptionTermsText.left(to: view)
        subscriptionTermsText.right(to: view)
        subscriptionTermsText.height(200)
        
        IAPHelper.getSubscriptionTerms(with: IAPHelper.Product1, completed: {()->() in
            self.subscriptionTermsText.text = IAPHelper.subscriptionTerms
        })
        
        
        
    }
    
    @objc func buyButtonTapped() {
        IAPHelper.purchaseProduct(with: IAPHelper.Product1, sharedSecret: IAPHelper.sharedSecret, type: .simple)
    }
    
}

