//
//  BGView.swift
//  WeatherForcast
//
//  Created by Dakota-Cheyenne Brown on 4/13/20.
//  Copyright © 2020 Dakota-Cheyenne Brown. All rights reserved.
//

import SwiftUI

struct BGView: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
    }
}

struct BGView_Previews: PreviewProvider {
    static var previews: some View {
        BGView()
    }
}
