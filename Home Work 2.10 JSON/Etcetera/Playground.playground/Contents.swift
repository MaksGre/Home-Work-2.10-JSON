import UIKit

var str = "Hello, playground"

class DataManager {
    
    static let shared = DataManager()
    
    let symbols: [String: String] = [
        "A": "Agilent Technologies",
        "AAPL": "Apple Inc.",
        "BRK.A": "Berkshire Hathaway",
        "C": "Citigroup",
        "GOOG": "Alphabet Inc.",
        "HOG": "Harley-Davidson Inc.",
        "HPQ": "Hewlett-Packard",
        "INTC": "Intel",
        "KO": "The Coca-Cola Company",
        "LUV": "Southwest Airlines",
        "MMM": "Minnesota Mining and Manufacturing",
        "MSFT": "Microsoft",
        "T": "AT&T",
        "TGT": "Target Corporation",
        "TXN": "Texas Instruments",
        "WMT": "Walmart"
    ]
}
