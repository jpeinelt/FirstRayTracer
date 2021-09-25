//
//  ImageExportable.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 05.07.21.
//

import Foundation
import simd

protocol ImageExportable {

    var fileExtension: String { get }
    var fileName: String { get }

    func export(width: Int, height: Int, pixelData: [simd_double3])
}
