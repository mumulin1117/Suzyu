//
//  ZompassHeadingSuzy.swift
//  SuzyueBiag
//
//  Created by  on 2026/3/27.
//

import StoreKit
import UIKit
class ZompassHeadingSuzy: NSObject {
    var interpolationSuzy: String?
    static let shared = ZompassHeadingSuzy()
    private var antialiasingSuue: ((Result<Void, Error>) -> Void)?
    private var pixelAlignSuzy: SKProductsRequest?
    
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }
    
    deinit {
        SKPaymentQueue.default().remove(self)
    }

    func regionLocaleSuue(calendarDateSuue: String, timestampSuzy: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            DispatchQueue.main.async {
                timestampSuzy(.failure(NSError(domain: "",
                                            code: -1,
                                                      userInfo: [NSLocalizedDescriptionKey: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "OOcUtCjNFmLtBu1fjQrsH1eJjx4eSsAEr8l1pX2e2sT0wMQkkVOAtHalwd3Zs4p1p0N5m3NiK60Zmxm95YBYIsapDZQOm6XAtosb0RQ=")])))
            }
            
            return
        }
        
        self.antialiasingSuue = timestampSuzy
        pixelAlignSuzy?.cancel()
        let durationSuue = SKProductsRequest(productIdentifiers: [calendarDateSuue])
        durationSuue.delegate = self
        self.pixelAlignSuzy = durationSuue
        durationSuue.start()
    }

}

extension ZompassHeadingSuzy: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let p = response.products.first else {
            DispatchQueue.main.async {
                self.antialiasingSuue?(.failure(NSError(domain: "",
                                             code: -2,
                                             userInfo: [NSLocalizedDescriptionKey: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "Z0SIJtMlnRfYvE+JAbNbJBWpPudZhw8znZKIGSBrMRsMP52rT+79lsbQx/F28h9qTpZ8RWm+KQ==")])))
                self.antialiasingSuue = nil
            }
            
            return
        }
        SKPaymentQueue.default().add(SKPayment(product: p))
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.antialiasingSuue?(.failure(error))
            self.antialiasingSuue = nil
        }
        
    }
}

extension ZompassHeadingSuzy: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for countdownSuzy in transactions {
            switch countdownSuzy.transactionState {
            case .purchased:

                self.interpolationSuzy = countdownSuzy.transactionIdentifier
                SKPaymentQueue.default().finishTransaction(countdownSuzy)
                DispatchQueue.main.async {
                    self.antialiasingSuue?(.success(()))
                    self.antialiasingSuue = nil
                }
                
            case .failed:
                SKPaymentQueue.default().finishTransaction(countdownSuzy)
                let workerThreadSuue = (countdownSuzy.error as? SKError)?.code == .paymentCancelled
                ? NSError(domain: "", code: -999, userInfo: [NSLocalizedDescriptionKey:SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "GyvaacgDHigpvC+NHko5rjVsdRuNSW6RT2xcJToChRbRrvD/9JQCNAc+OLgPlyv9Kg==") ])
                : (countdownSuzy.error ?? NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: SuzyArtToyVibeEngine.suzyRestoreSecretVibeString(suzyEncodedString: "3yuU1N7RoFNTuXaiGUi+CUA5OFYIzCLnYMLrfWfHeXLzkQbiXc6wXvq/9O1afgmSWeJQ")]))
                DispatchQueue.main.async {
                    self.antialiasingSuue?(.failure(workerThreadSuue))
                    self.antialiasingSuue = nil
                }
                
            case .restored:
                SKPaymentQueue.default().finishTransaction(countdownSuzy)
            default:
                break
            }
        }
    }
}

extension ZompassHeadingSuzy {
    
    func backgroundFetchSuzy() -> Data? {
        guard let featureToggleSuzy = Bundle.main.appStoreReceiptURL else {
            return nil
        }
        return try? Data(contentsOf: featureToggleSuzy)
    }

    
    
}

