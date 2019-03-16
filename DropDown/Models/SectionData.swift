//
//  SectionData.swift
//  DropDown
//
//  Created by Buse ERKUŞ on 16.03.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

struct SectionData{
    var open: Bool
    var data: [CellData]
}

struct CellData {
    var title: String
    var featureImage: UIImage
}
