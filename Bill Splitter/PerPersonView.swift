//
//  PerPersonView.swift
//  Bill Splitter
//
//  Created by Devontae Reid on 2/11/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class PerPersonView: UIView {

    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.medium)
        lbl.text = "Title"
        lbl.textColor = .white
        return lbl
    }()
    
    let perPersonLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        lbl.text = "Per Person"
        lbl.textColor = .white
        return lbl
    }()

    let valueLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        lbl.textColor = .white
        lbl.textAlignment = .right
        return lbl
    }()
    
    let costLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        lbl.text = "$ 4.00"
        lbl.textColor = .white
        lbl.textAlignment = .right
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    private func setupView() {
        self.backgroundColor = .clear
        
        self.addSubview(titleLabel)
        self.addSubview(perPersonLabel)
        self.addSubview(valueLabel)
        self.addSubview(costLabel)
        
        // Get the superview's layout
        let margins = self.layoutMarginsGuide
        
        // Top
        let titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        // Leading Constraint
        let titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        // Trailing Constraint
        let titleLabelWidthConstraint = titleLabel.widthAnchor.constraint(equalToConstant: 50)
        // Height
        let titleLabelBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: margins.centerYAnchor)
        
        let titleLabelConstraints = [titleLabelTopConstraint,titleLabelLeadingConstraint,titleLabelWidthConstraint,titleLabelBottomConstraint]
        activateConstraints(constraints: titleLabelConstraints, active: true)
        
        // Top
        let perPersonLabelTopConstraint = perPersonLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        // Leading Constraint
        let perPersonLabelLeadingConstraint = perPersonLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        // Trailing Constraint
        let perPersonLabelWidthConstraint = perPersonLabel.widthAnchor.constraint(equalToConstant: 100)
        // Height
        let perPersonLabelBottomConstraint = perPersonLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        
        let perPersonConstraints = [perPersonLabelTopConstraint,perPersonLabelLeadingConstraint,perPersonLabelWidthConstraint,perPersonLabelBottomConstraint]
        activateConstraints(constraints: perPersonConstraints, active: true)
        
        // Top
        let valueLabelTopConstraint = valueLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        // Leading Constraint
        let valueLabelTrailingConstraint = valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        // Trailing Constraint
        let valueLabelWidthConstraint = valueLabel.widthAnchor.constraint(equalToConstant: 80)
        // Height
        let valueLabelBottomConstraint = valueLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        
        let valueLabelConstraints = [valueLabelTopConstraint,valueLabelTrailingConstraint,valueLabelWidthConstraint,valueLabelBottomConstraint]
        activateConstraints(constraints: valueLabelConstraints, active: true)
        
        // Top
        let costLabelTopConstraint = costLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        // Leading Constraint
        let costLabelTrailingConstraint = costLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        // Trailing Constraint
        let costLabelWidthConstraint = costLabel.widthAnchor.constraint(equalToConstant: 100)
        // Height
        let costLabelBottomConstraint = costLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        
        let costLabelConstraints = [costLabelTopConstraint,costLabelTrailingConstraint,costLabelWidthConstraint,costLabelBottomConstraint]
        activateConstraints(constraints: costLabelConstraints, active: true)
    }
    
    private func activateConstraints(constraints: [NSLayoutConstraint], active: Bool) {
        for constraint in constraints {
            constraint.isActive = active
        }
    }
}
