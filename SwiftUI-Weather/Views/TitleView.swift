//
//  TitleView.swift
//  SwiftUI-Weather
//
//  Created by Kody Buss on 2/8/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
		Image(systemName: "cloud.sun.fill")
			.renderingMode(.original)
			.resizable()
			.scaledToFit()
			.padding(30)
		
		Text("Weather")
			.foregroundStyle(.white)
			.font(.system(size: 58))
			.fontWeight(.bold)
			.frame(alignment: .center)
    }
}

#Preview {
    TitleView()
		.background(.black)
}
