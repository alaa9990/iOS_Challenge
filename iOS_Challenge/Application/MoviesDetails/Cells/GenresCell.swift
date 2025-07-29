//
//  GenresCell.swift
//  iOS_Challenge
//
//  Created by Alaa Hassan on 28/07/2025.
//

import UIKit

class GenresCell: UICollectionViewCell {
    
    //MARK: - IBOutLets -
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var genresTitle: UILabel!
    
    
    
    
    
    
    //MARK: - LifeCycle Events -
    override func awakeFromNib() {
        super.awakeFromNib()
        containerStackView.layer.cornerRadius = 8
    }
    
    
    
    
    //MARK: - Configure Cell -
    func configureCell(model: Genre) {
        genresTitle.text = model.name
    }
    
    
    

}
