//
//  Copyright 2024 Roman Likhachev
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

@available(iOS 17.0, *)
@Observable
class ModelData {
    var landmarks: [Landmark] = [
        Landmark(
            id: 1,
            name: "name",
            park: "park",
            state: "park",
            description: "park",
            isFavorite: true,
            imageName: "icon_app", category: Landmark.Category.lakes,
            coordinates: Landmark.Coordinates(latitude: 1.0, longitude: 1.0), isFeatured: true
        ),
        Landmark(
            id: 2,
            name: "name",
            park: "park",
            state: "park",
            description: "park",
            isFavorite: false,
            imageName: "icon_app", category: Landmark.Category.mountains,
            coordinates: Landmark.Coordinates(latitude: 1.0, longitude: 1.0), isFeatured: false
        )
    ]
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var profile = Profile.default
    
    var features: [Landmark] {
           landmarks.filter { $0.isFeatured }
       }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
