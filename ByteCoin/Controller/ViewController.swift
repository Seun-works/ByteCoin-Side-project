import UIKit

class ViewController: UIViewController {
    
    var coinManager = CoinManager()
    
   
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.delegate = self
    }
    
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didGetApi(price: Double) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = String(format: "%.2f", price)
        }
    }
    
    func onFetchApiError() {
        print("An error occured")
    }
}

//MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel.text = coinManager.currencyArray[row]
        let pickedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: pickedCurrency)
    }
    
}

//MARK: - UIPickerDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}
