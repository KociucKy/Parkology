//
//  ParkDetailsViewController.swift
//  Parkology
//

import UIKit
import MapKit

class ParkDetailsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    var park: Park!

    override func viewDidLoad() {
        super.viewDidLoad()
        setImg()
        setLabels()
    }

    private func setLabels() {
        titleLabel.text = park.fullName
        descriptionLabel.text = park.description
    }

    private func setImg() {
        let url = park.images.first!.url
        imageView.load(url: URL(string: url)!)
    }
}
