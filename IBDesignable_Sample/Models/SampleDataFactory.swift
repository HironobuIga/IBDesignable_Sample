//
//  SampleDataFactory.swift
//  IBDesignable_Sample
//
//  Created by HironobuIga on 2019/01/20.
//  Copyright © 2019 iganin. All rights reserved.
//

import Foundation

final class SampleDataFactory {
    
    static func makeMainData() -> SampleData {
        let data = SampleData(imageName: "cat_picture", name: "ねこ", category: "食肉目/ネコ科/ネコ属",
                              outlineText: "Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample"
        )
        return data
    }
    
    static func makeSubDataList() -> [SampleData] {
        let sakuraData = SampleData(imageName: "sakura_picture", name: "さくら", category: "バラ科モモ亜科スモモ属",
                                    outlineText: "Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample")
        let hukurouData = SampleData(imageName: "hukurou_picture", name: "フクロウ", category: "鳥綱フクロウ目フクロウ科フクロウ属",
                                     outlineText: "Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample")
        let shikaData = SampleData(imageName: "shika_picture", name: "シカ", category: "哺乳綱偶蹄目シカ科シカ属",
                                   outlineText: "Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample")
        let bananaData = SampleData(imageName: "banana_picture", name: "バナナ", category: "バショウ科バショウ属",
                                    outlineText: "Sample Sample Sample Sample Sample Sample Sample Sample Sample Sample")
        return [sakuraData, hukurouData, shikaData, bananaData]
    }
}
