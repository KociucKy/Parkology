//
//  UIImageView+Load.swift
//  Parkology
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.main.async {
            let data = try! Data(contentsOf: url)
            let image = UIImage(data: data)
            self.image = image
        }
    }
}
