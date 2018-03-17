//
//  MapViewBarViewController.swift
//  BalticMuseums
//
//  Created by Maciej Durazinski on 17.03.2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

protocol MapViewBarViewControllerDelegate: NSObjectProtocol {
	func didSelectBottomBar()
}

import UIKit

class MapViewBarViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var iconImageView: UIImageView!

	weak var delegate: MapViewBarViewControllerDelegate?
	var selectedExibition: Exhibition? {
		didSet {
			label.text = exhibitionTitleForType(selectedExibition!)
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		let tapGesture = UITapGestureRecognizer()
		tapGesture.addTarget(self, action: #selector(handleTapGesture))
		view.addGestureRecognizer(tapGesture)
		
		iconImageView.image = UIImage(named:"disclosure_left")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
		iconImageView.tintColor = UIColor(named:"main")
    }

	@objc func handleTapGesture() {
		self.delegate?.didSelectBottomBar()
	}

	func exhibitionTitleForType(_ type: Exhibition) -> String {
		switch type {
		case .Lecture:
			return "Salka wykładowa"
		case .Human:
			return "Akcja człowiek"
		case .InvisibleForces:
			return "Niewidoczne siły"
		case .TreeOfLife:
			return "Drzewo życia"
		case .LaboratoryRoom:
			return "Sala laboratoryjna"
		case .RestRoom:
			return "Strefa odpoczynku i automaty ze zdrową żywnością"
		case .Kid:
			return "Strefa malucha"
		case .Hydro:
			return "Hydroświat"
		case .Health:
			return "Kierunek zdrowie"
		case .WorkshopRoom:
			return "Salka warsztatowa"
		case .TempExhibition:
			return "Wystawa czasowa"
		case .CloakRoom:
			return "Szatnia dla grup"
		case .Toilets:
			return "Toalety"
		case .FamilyRoom:
			return "Toalety, pokój rodzinny i punkt medyczny"
		case .GuestCloakRoom:
			return "Szatnia dla gości indywidualnych"
		case .Cash:
			return "Kasy"
		case .Entrance:
			return "Wejście"
		case .Shop:
			return "Sklep"
		case .PortableScene:
			return "Przenośnia scena"
		}
	}
}
