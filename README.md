# SwiftyStoreKit Helper (IAPHelper)

IAPHelper makes SwiftyStorekit even lighter. Nothing but sugar.

## Prerequisites

1. SwiftyStoreKit 
2. StoreKit
3. iOS 5 or later

##### Add the IAPHelper folder to your project.
You can install SwiftyStoreKit as a CocoaPod. https://github.com/bizz84/SwiftyStoreKit

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
