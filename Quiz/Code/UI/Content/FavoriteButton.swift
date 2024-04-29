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

import SwiftUI


struct FavoriteButton: View {
    @Binding var isSet: Bool
    
    @State private var showDetail = false

    var body: some View {
        Button {
            isSet.toggle()
            withAnimation(.easeInOut(duration: 4)) {
                showDetail.toggle()
            }
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
                .rotationEffect(.degrees(showDetail ? 90 : 0))
                .animation(.easeInOut, value: showDetail)
        }
    }
}


#Preview {
    FavoriteButton(isSet: .constant(true))
}
