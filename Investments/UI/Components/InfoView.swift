//
//  Cell.swift
//  Investments
//
//  Created by finteh on 09.03.2020.
//  Copyright © 2020 argas. All rights reserved.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    func configure(with model: InfoView.Model) {
        titleLabel.text = model.title
        subtitle.text = model.subtitle
    }
}

extension InfoView {
    struct Model {
        typealias View = InfoView
        
        let title: String
        let subtitle: String
        var tapAction: () -> Void
    }
}

// MARK - Cell

class InfoCell: UITableViewCell {
    lazy var viewFromNib: InfoView? = {
        Bundle(for: InfoCell.self).loadNibNamed("InfoView", owner: self, options: nil)?.first as? InfoView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        guard let view = viewFromNib else { return }
        
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: InfoView.Model) {
        viewFromNib?.configure(with: model)
    }
}
