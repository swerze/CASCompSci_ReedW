import UIKit

let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json")!
let fileContents = try! Data(contentsOf: fileUrl)

func main() {
    let json = try? JSONSerialization.jsonObject(with: fileContents, options: [])
    
    let dictionary: [String: Any] = json as! [String: Any]
    
    let name: String = dictionary["name"] as! String
    let militias: [String] = dictionary["militias"] as! [String]
    
    print("Hello my name is \(name) and if you cross me I will send the \(militias.joined(separator: ", ")) to kill you.")
}

main()
