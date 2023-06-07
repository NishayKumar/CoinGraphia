//
//  MarketDataModel.swift
//  CoinGraphia
//
//  Created by Nishay Kumar on 08/06/23.
//

import Foundation

//JSON Data
/*
 URL:
 https://api.coingecko.com/api/v3/global

 
 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 10007,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 751,
     "total_market_cap": {
       "btc": 43380041.386711724,
       "eth": 620821761.7929972,
       "ltc": 12942593188.594906,
       "bch": 10297080660.754713,
       "bnb": 4406371239.04769,
       "eos": 1337853333469.1438,
       "xrp": 2214155837758.3354,
       "xlm": 13105550719893.918,
       "link": 193451846161.14328,
       "dot": 227887240670.35086,
       "yfi": 191411897.34572226,
       "usd": 1149494875908.449,
       "aed": 4222094679211.7275,
       "ars": 279971289236847.16,
       "aud": 1727448255071.5774,
       "bdt": 124061926599418.52,
       "bhd": 433336578319.9664,
       "bmd": 1149494875908.449,
       "brl": 5658388526659.332,
       "cad": 1537037877361.9736,
       "chf": 1046035739097.1837,
       "clp": 910365456873214,
       "cny": 8195668566252.036,
       "czk": 25387973728289.12,
       "dkk": 8001676362509.109,
       "eur": 1074238595877.5979,
       "gbp": 924118013568.5834,
       "hkd": 9014898620878.588,
       "huf": 396159680564543.06,
       "idr": 17112552501756698,
       "ils": 4200691084622.309,
       "inr": 94981092529755.06,
       "jpy": 161130444230466.7,
       "krw": 1503097883609437,
       "kwd": 353670835945.1314,
       "lkr": 335532204528523.3,
       "mmk": 2413033885748526,
       "mxn": 19943336072794.742,
       "myr": 5296297640748.189,
       "ngn": 531066632669700.3,
       "nok": 12698274480031.727,
       "nzd": 1903488797337.4543,
       "php": 64458499914003.95,
       "pkr": 329588918294849.44,
       "pln": 4819668786411.734,
       "rub": 94259538503218.97,
       "sar": 4310960978573.33,
       "sek": 12526120379941.293,
       "sgd": 1550373167417.387,
       "thb": 40058172183095.5,
       "try": 26696789743493.387,
       "twd": 35357887635505.85,
       "uah": 42430299695886.96,
       "vef": 115098921924.71269,
       "vnd": 26999292818607010,
       "zar": 21972910664080.85,
       "xdr": 861216504463.9948,
       "xag": 48975114299.13365,
       "xau": 591978366.144093,
       "bits": 43380041386711.73,
       "sats": 4338004138671172.5
     },
     "total_volume": {
       "btc": 1921192.5776580938,
       "eth": 27494629.388958663,
       "ltc": 573194795.9181409,
       "bch": 456031721.1465024,
       "bnb": 195147064.13944754,
       "eos": 59250148503.624756,
       "xrp": 98059375355.5683,
       "xlm": 580411773809.2927,
       "link": 8567494153.956504,
       "dot": 10092550890.30354,
       "yfi": 8477149.96806576,
       "usd": 50908227679.28032,
       "aed": 186985920265.99637,
       "ars": 12399221984236.336,
       "aud": 76504324565.91779,
       "bdt": 5494389699355.544,
       "bhd": 19191383670.535065,
       "bmd": 50908227679.28032,
       "brl": 250595750751.25702,
       "cad": 68071529375.528175,
       "chf": 46326283555.23432,
       "clp": 40317789075159.625,
       "cny": 362965481707.7318,
       "czk": 1124369298170.1182,
       "dkk": 354374056479.8939,
       "eur": 47575316921.34548,
       "gbp": 40926855111.11456,
       "hkd": 399247113767.7945,
       "huf": 17544912672700.748,
       "idr": 757871772368345.9,
       "ils": 186038009066.60803,
       "inr": 4206472934392.331,
       "jpy": 7136060814943.112,
       "krw": 66568412688712.164,
       "kwd": 15663188951.222546,
       "lkr": 14859874732690.287,
       "mmk": 106867182297286.1,
       "mxn": 883240034172.2798,
       "myr": 234559659032.28455,
       "ngn": 23519601187827.37,
       "nok": 562374536774.3041,
       "nzd": 84300716002.08893,
       "php": 2854704321229.4717,
       "pkr": 14596661581341.625,
       "pln": 213450969690.89136,
       "rub": 4174517127162.855,
       "sar": 190921584439.6537,
       "sek": 554750266055.9164,
       "sgd": 68662115724.83548,
       "thb": 1774075372281.3965,
       "try": 1182333457113.9758,
       "twd": 1565911629300.8193,
       "uah": 1879130914534.2798,
       "vef": 5097440837.526325,
       "vnd": 1195730555043095.2,
       "zar": 973124771852.0541,
       "xdr": 38141105984.27656,
       "xag": 2168984239.611039,
       "xau": 26217228.17255261,
       "bits": 1921192577658.0938,
       "sats": 192119257765809.38
     },
     "market_cap_percentage": {
       "btc": 44.71069501086571,
       "eth": 19.354745280126973,
       "usdt": 7.249303468460614,
       "bnb": 3.5815790085570574,
       "usdc": 2.4810335637706085,
       "xrp": 2.3446393236625367,
       "steth": 1.1466811239236483,
       "ada": 0.9884437706941137,
       "doge": 0.8240584051755585,
       "sol": 0.6576789520223328
     },
     "market_cap_change_percentage_24h_usd": -1.5528595417206608,
     "updated_at": 1686167712
   }
 }
 
 
 */


struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { key, value -> Bool in
            return key == "inr"
        }) {
            return "₹" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    
    var volume: String {
        if let item = totalVolume.first(where: { key, value -> Bool in
            return key == "inr"
        }) {
            return "₹" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { key, value -> Bool in
            return key == "btc"
        }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
    
}


