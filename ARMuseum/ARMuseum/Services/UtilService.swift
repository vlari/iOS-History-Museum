//
//  UtilService.swift
//  ARMuseum
//
//  Created by Obed Garcia on 8/1/22.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins

class UtilService {
    static let shared = UtilService()
    private init() {}
    
    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImg)
            }
        }
        
        return UIImage(systemName: "qrcode") ?? UIImage()
    }
    
    func getFormattedDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/DD/YY"
        dateFormatter.dateStyle = .short
        
        return dateFormatter.string(from: date)
    }
    
    func getFormattedTime(time: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: time)
    }
}
