//
//  ParkDetailsViewController.swift
//  Parkology
//

import UIKit
import MapKit

class ParkDetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
	@IBOutlet weak var addToFavoritesButton: UIButton!
	@IBOutlet var descriptionLabel: UILabel!

    var park: Park!

    override func viewDidLoad() {
        super.viewDidLoad()
        setImg()
        setLabels()
		setButton()
    }

    private func setLabels() {
        titleLabel.text = park.fullName
        descriptionLabel.text = park.description
    }

	// TODO: - Handle force unwrapping 
    private func setImg() {
        let url = park.images.first!.url
        imageView.load(url: URL(string: url)!)
    }

	private func setButton() {
		addToFavoritesButton.setTitle("Add to favorites", for: .normal)
		addToFavoritesButton.setImage(UIImage(systemName: "plus"), for: .normal)
		addToFavoritesButton.setTitleColor(.parkPurple, for: .normal)
	}
}
