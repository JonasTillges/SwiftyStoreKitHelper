# SwiftyStoreKit Helper (IAPHelper)
<a href="https://ibb.co/FXbNZj1"><img src="https://i.ibb.co/RNpZrVK/Swifty-Store-Kit-Helper.png" alt="Swifty-Store-Kit-Helper" border="0"></a><br />
IAPHelper makes SwiftyStoreKit even lighter. 

## Prerequisites

1. SwiftyStoreKit 
2. StoreKit
3. iOS 5 or later

### Add the "SwiftyStoreKitHelper" folder to your project.

### Important!

Install SwiftyStoreKit as a CocoaPod. https://github.com/bizz84/SwiftyStoreKit

```
pod 'SwiftyStoreKit'
```
## Set the products and sharedSecret in IAPHelper.swift
```
static let proSubscription = "ProductId"
```
```
static let sharedSecret = "yourSharedSecret"
```
### Let's get started: 

Insert ```IAPHelper.startHelper()``` in your didFinishLaunchingWithOptions.
```
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IAPHelper.startHelper()
        
        return true
    }
```
## Get Product Informations
```
        IAPHelper.getProductInfo(with: IAPHelper.Product1, completed: {() -> () in
            self.priceTag.text = IAPHelper.Info[0].priceString
            self.productName.text = IAPHelper.Info[0].name
            self.productDescription.text = IAPHelper.Info[0].localizedDescription
        })
```

## Get Subscription Terms
For auto-renewable Subscriptions.
```
        IAPHelper.getSubscriptionTerms(with: IAPHelper.Product1, completed: {()->() in
            self.subscriptionTermsText.text = IAPHelper.subscriptionTerms
        })
```

## Verify Purchase

Verify your Purchases with just one function call.

### Verify consumable, non-consuable and subscriptions

```
IAPHelper.verifyPurchase(with: IAPHelper.proSubscription, sharedSecret: IAPHelper.sharedSecret, type: .autoRenewable)
```

## Purchase

Purchase products.

```
IAPHelper.purchaseProduct(with: IAPHelper.proSubscription, sharedSecret: IAPHelper.sharedSecret, type: .autoRenewable)
```
## Restore Purchase

```
IAPHelper.restorePurchases()
```


## additionally

### loading indicator
If you want you can use my loading indicator I have used in the demo project.
Just use the IAPHelper.swift from the demo.

If you want to do it yourself:

Start the animation:
```
Spinner.start()
```

Stop the animation:
```
Spinner.stop()
```
