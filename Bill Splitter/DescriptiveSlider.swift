//
//  DescriptiveSlider.swift
//  Bill Splitter
//
//  Created by Devontae Reid on 2/11/18.
//  Copyright © 2018 Devontae Reid. All rights reserved.
//

import UIKit

class DescriptiveSlider: UIView {
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 19, weight: UIFont.Weight.thin)
        lbl.text = "Title :"
        lbl.textColor = .white
        return lbl
    }()

    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumTrackTintColor = .white
        return slider
    }()
    
    let minValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()

    let maxValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin)
        lbl.textAlignment = .center
        lbl.textColor = .white
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
        self.backgroundColor = UIColor.clear
        
        // add objects
        self.addSubview(titleLabel)
        self.addSubview(slider)
        self.addSubview(minValueLabel)
        self.addSubview(maxValueLabel)
        
        // Get the superview's layout
        let margins = self.layoutMarginsGuide
        
        // Top
        let titleLabelTopConstraint = titleLabel.topAnchor.constraint(equalTo: margins.topAnchor)
        // Leading Constraint
        let titleLabelLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        // Trailing Constraint
        let titleLabelWidthConstraint = titleLabel.widthAnchor.constraint(equalToConstant: 50)
        // Height
        let titleLabelBottomConstraint = titleLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        
        let titleLabelConstraints = [titleLabelTopConstraint,titleLabelLeadingConstraint,titleLabelWidthConstraint,titleLabelBottomConstraint]
        activateConstraints(constraints: titleLabelConstraints, active: true)
        
        // Top
        let sliderTopConstraint = slider.topAnchor.constraint(equalTo: margins.topAnchor)
        // Leading Constraint
        let sliderLeadingConstraint = slider.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10)
        // Trailing Constraint
        let sliderTrailingConstraint = slider.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        // Height
        let sliderBottomConstraint = slider.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        
        let sliderConstraints = [sliderTopConstraint,sliderLeadingConstraint,sliderTrailingConstraint,sliderBottomConstraint]
        activateConstraints(constraints: sliderConstraints, active: true)
        
        // Top
        let minValueLabelTopConstraint = minValueLabel.topAnchor.constraint(equalTo: margins.centerYAnchor, constant: 10)
        // Leading Constraint
        let minValueLabelLeadingConstraint = minValueLabel.leadingAnchor.constraint(equalTo: slider.leadingAnchor, constant: 5)
        // Trailing Constraint
        let minValueLabelWidthConstraint = minValueLabel.widthAnchor.constraint(equalToConstant: 20)
        // Height
        let minValueLabelHeightConstraint = minValueLabel.heightAnchor.constraint(equalToConstant: 15)
        
        let minValueLabelConstraints = [minValueLabelTopConstraint,minValueLabelLeadingConstraint,minValueLabelWidthConstraint,minValueLabelHeightConstraint]
        activateConstraints(constraints: minValueLabelConstraints, active: true)
        
        // Top
        let maxValueLabelTopConstraint = maxValueLabel.topAnchor.constraint(equalTo: margins.centerYAnchor, constant: 10)
        // Leading Constraint
        let maxValueLabelLeadingConstraint = maxValueLabel.trailingAnchor.constraint(equalTo: slider.trailingAnchor, constant: -5)
        // Trailing Constraint
        let maxValueLabelWidthConstraint = maxValueLabel.widthAnchor.constraint(equalToConstant: 25)
        // Height
        let maxValueLabelHeightConstraint = maxValueLabel.heightAnchor.constraint(equalToConstant: 15)
        
        let maxValueLabelConstraints = [maxValueLabelTopConstraint,maxValueLabelLeadingConstraint,maxValueLabelWidthConstraint,maxValueLabelHeightConstraint]
        activateConstraints(constraints: maxValueLabelConstraints, active: true)
    }
    
    private func activateConstraints(constraints: [NSLayoutConstraint], active: Bool) {
        for constraint in constraints {
            constraint.isActive = active
        }
    }
}
