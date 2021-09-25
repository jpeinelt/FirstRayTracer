//
//  PPMExporter.swift
//  FirstRayTracer
//
//  Created by Julius Peinelt on 05.07.21.
//

import Foundation
import simd

class PPMExporter: ImageExportable {

    var fileName: String
    var fileExtension: String = "ppm"


    init(fileName: String) {
        self.fileName = fileName
    }

    func export(width: Int, height: Int, pixelData: [simd_double3]) {

        let file = "\(self.fileName).\(self.fileExtension)"
        let header = ["P3\n\(width) \(height)\n255"]

        let colorData: [String] = pixelData.map({ color in
            color.toColorString()
        })
        let data = header + colorData


        var text = data.joined(separator: "\n")
        text.append("\n")


        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)

            do {
                try text.write(to: fileURL, atomically: true, encoding: .utf8)
            }
            catch {
                fatalError("PPM Export failed miserably!")
            }
        } else {
            fatalError("Could not resolve Document directory")
        }
    }
}
