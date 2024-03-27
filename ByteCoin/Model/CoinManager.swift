//
//  CoinManager.swift
//  ByteCoin



import Foundation

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "FCDF0C04-CF4C-4E9E-A7B9-F78DC97418B1"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    return
                }
                if let safeData = data {
                    if let cryptoPrice = parseJSON(safeData) {
                        self.delegate?.didGetApi(price: cryptoPrice)
                    }
                }
            })
            
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CryptodATA.self, from: data)
            let actualPrice = decodedData.rate
            return actualPrice
        } catch {
            self.delegate?.onFetchApiError()
            return nil
        }
    }
}
