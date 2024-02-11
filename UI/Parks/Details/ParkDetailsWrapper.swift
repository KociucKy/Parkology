//
//  ParkDetailsWrapper.swift
//  Parkology
//

import SwiftUI

struct ParkDetailsWrapper: UIViewControllerRepresentable {
    var park: Park

    func makeUIViewController(context: Context) -> ParkDetailsViewController {
        let controller = UIStoryboard(name: "ParkDetails", bundle: Bundle.main).instantiateViewController(identifier: "ParkDetails")
		// TODO: Force type casting -> research the correct way to do it
        let vc = controller as! ParkDetailsViewController
        vc.park = park
        return vc
    }

    func updateUIViewController(_ uiViewController: ParkDetailsViewController, context: Context) {

    }
}
