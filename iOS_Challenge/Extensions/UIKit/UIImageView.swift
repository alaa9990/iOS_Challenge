//
//  UIImageView.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import UIKit.UIImageView
import Kingfisher

extension UIImageView {
    func setWith(_ stringURL: String?) {
        self.kf.indicatorType = .activity
        let placeholder = UIImage(named: "EmptyImage")
        guard let stringURL, let url = URL(string: stringURL) else {
            self.image = UIImage(named: "EmptyImage")
            return
        }
        self.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .onFailureImage(placeholder),
                .transition(.fade(0.4))
            ]
        )
    }
}
