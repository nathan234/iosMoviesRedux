//
//  File.swift
//  MoviesRedux
//
//  Created by Nathan Retta on 3/6/21.
//

import Foundation

class ImageDownloader: ObservableObject {
    
    @Published var downloadedData: Data? = nil
    
    func downloadImage(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            fatalError("ImageURL is not correct")
        }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageUrl)
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
    }
}
