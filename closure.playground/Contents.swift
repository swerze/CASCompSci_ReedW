import UIKit

var queue = DispatchQueue(label: "swerze", attributes: [.concurrent])

func getName(_ data: Data) -> String? {
    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let name = json["name"] as? String {
        return name
    }   else {
        return nil
    }
}
