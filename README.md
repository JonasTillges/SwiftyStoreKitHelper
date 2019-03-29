# SwiftyStoreKit Helper (IAPHelper)
<img src="https://i.ibb.co/RNpZrVK/Swifty-Store-Kit-Helper.png" width="1000">
IAPHelper makes SwiftyStoreKit even lighter. 

# NEWS
SwiftyStoreKitHelper now supports auto-renewable Subscribtions. You can easily implement the needed Terms or product information of your IAP product. 

### Terms Sample:
```
Subscription price: 9,99$ Description: Premium to use all features. Free Trial: 1 Week. Subscription duration: 1 Month Please read below about the auto-renewing subscription nature of this product: 

• Payment will be charged to iTunes Account at confirmation of purchase • Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period • Account will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of the renewal • Subscriptions may be managed by the user and auto-renewal may be turned off by going to the user's Account Settings after purchase • Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable Terms of Use: "your Terms Of Use link" Privacy Policy: "your Privacy Policy link".
```
## 

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



