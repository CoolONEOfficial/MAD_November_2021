//
//  WordInfoModel.swift
//  WordsFactory
//
//  Created by Nickolay Truhin on 05.11.2021.
//

import Foundation

struct WordInfoModel: Codable {
    let word: String?
    let phonetic: String?
    let meanings: [MeaningModel]
}

struct MeaningModel: Codable {
    let partOfSpeech: String
    let definitions: [DefinitionModel]
}

struct DefinitionModel: Codable {
    let definition: String
    let example: String
}

//let test= [
//    {
//        "word":"cooking",
//        "phonetic":"ˈkʊkɪŋ",
//        "phonetics":[{"text":"ˈkʊkɪŋ","audio":"//ssl.gstatic.com/dictionary/static/sounds/20200429/cooking--_gb_1.mp3"}],
//        "meanings":[{"partOfSpeech":"noun","definitions":[{"definition":"the practice or skill of preparing food by combining, mixing, and heating ingredients.","example":"he developed an interest in cooking","synonyms":[],"antonyms":[]}]}]},{"word":"cook","phonetic":"kʊk","phonetics":[{"text":"kʊk","audio":"//ssl.gstatic.com/dictionary/static/sounds/20200429/cook--_gb_1.mp3"}],"origin":"Old English cōc (noun), from popular Latin cocus, from Latin coquus .","meanings":[{"partOfSpeech":"verb","definitions":[{"definition":"prepare (food, a dish, or a meal) by mixing, combining, and heating the ingredients.","example":"shall I cook dinner tonight?","synonyms":["prepare","make","get","put together","bake","fix","knock up","rustle up"],"antonyms":[]},{"definition":"alter dishonestly; falsify.","example":"a narcotics team who cooked the evidence","synonyms":["falsify","alter","doctor","tamper with","interfere with","massage","manipulate","rig","misrepresent","forge","fiddle"],"antonyms":[]},{"definition":"be happening or planned.","example":"what's cooking on the alternative fuels front?","synonyms":["happen","go on","occur","take place","go down"],"antonyms":[]},{"definition":"perform or proceed vigorously or very well.","example":"the band used to get up on the bandstand and really cook","synonyms":[],"antonyms":[]}]}]}]
