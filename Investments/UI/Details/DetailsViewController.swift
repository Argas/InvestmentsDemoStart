//
//  DetailsViewController.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import UIKit

protocol StockDetailsController: AnyObject {
    func setup(_ model: DetailsViewController.Model)
    func showSuccess()
    func show(error: Error)
}

class DetailsViewController: UIViewController {
    
    // Deps
    private let interactor: StockDetailsInteractor
    
    // UI
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: - Lifecycle
    
    init(interactor: StockDetailsInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        name.accessibilityIdentifier = "stock_details_name"
//        info.accessibilityIdentifier = "stock_details_info"
//        linkLabel.accessibilityIdentifier = "stock_details_link"
//        buyButton.accessibilityIdentifier = "buy_button"
        
        interactor.load()
    }
    
    @IBAction func buyAction(_ sender: Any) {
        interactor.buy()
    }
    
    struct Model {
        let price: String
        let ticket: String
        let name: String
        let description: String
        let url: String?
    }
}

extension DetailsViewController: StockDetailsController {
    func setup(_ model: Model) {
        self.price.text = model.price
        self.title = model.ticket
        self.name.text = model.name
        info.text = model.description
        linkLabel.text = model.url
    }
    
    func showSuccess() {
        let ac = UIAlertController(title: "Поздравляем!",
                                   message: "Вы купили бумагу",
                                   preferredStyle: .alert)
        self.present(ac, animated: true, completion: nil)
    }
    
    func show(error: Error) {
        let ac = UIAlertController(title: "Ошибка",
                                   message: "Что-то пошло не так",
                                   preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        self.present(ac, animated: true, completion: nil)
    }
}
