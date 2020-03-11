//
//  ViewController.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import UIKit

protocol StocksListController: AnyObject {
    func showSpinner()
    func hideSpinner()
    func setup(model: StocksListViewController.Model)
}

protocol StocksListRouter: AnyObject {
    func showDetails(for symbol: String)
}

class StocksListViewController: UIViewController {
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var table: UITableView!
//    private lazy var adapter = AZTableAdapter(table: table)
    
    private let interactor: StocksListInteractor
    private let detailsAssembly: StockDetailsAssembly
    
    private var model: Model?
    
    init(interactor: StocksListInteractor, detailsAssembly: StockDetailsAssembly) {
        self.interactor = interactor
        self.detailsAssembly = detailsAssembly
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.register(InfoCell.self, forCellReuseIdentifier: "InfoCell")
        
//        activityView.accessibilityIdentifier = "stocks_list_activity"
//        table.accessibilityIdentifier = "stocks_list_table"
        interactor.controller = self
        interactor.loadSymbols()
    }
}

extension StocksListViewController: StocksListController {
    func showSpinner() {
        DispatchQueue.main.async {
            self.activityView.startAnimating()
        }
    }
    
    func hideSpinner() {
        DispatchQueue.main.async {
            self.activityView.stopAnimating()
        }
    }
    
    func setup(model: StocksListViewController.Model) {
        DispatchQueue.main.async {
            self.title = model.title
            
            self.model = model
            self.table.reloadData()
        }
    }
}

extension StocksListViewController: StocksListRouter {
    func showDetails(for symbol: String) {
        let vc = detailsAssembly.viewController(for: symbol)
        self.present(vc, animated: true, completion: nil)
    }
}

extension StocksListViewController {
    struct Model {
        let title: String
        let cells: [InfoView.Model]
    }
}

extension StocksListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.cells.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        
        guard let model = model else { return cell }
        
        if let infoCell = cell as? InfoCell {
            infoCell.configure(with: model.cells[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model?.cells[indexPath.row].tapAction()
    }
}
