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

class AnswerAbParserDelegate: AbQuestParser {
    
    let answerA = NSLocalizedString("CODE_ANSWER_A", comment: "only A is true")
    let answerB = NSLocalizedString("CODE_ANSWER_B", comment: "only B is true")
    let answerYes = NSLocalizedString("CODE_ANSWER_YES", comment: "both statements are correct")
    let answerYesVariant = NSLocalizedString("CODE_ANSWER_YES_VARIANT", comment: "both statements are true")
    let answerNo = NSLocalizedString("CODE_ANSWER_NO", comment: "both statements are wrong")
    let answerNoVariant = NSLocalizedString("CODE_ANSWER_NO_VARIANT", comment: "both statements are wrong")
    
    let answers: [String]
    let classicAnswers: [String]
    let varaintAnswers: [String]
    
    init() {
        answers = [answerA, answerB, answerYes, answerYesVariant, answerNo, answerNoVariant]
        classicAnswers = [answerA, answerB, answerYes, answerNo]
        varaintAnswers = [answerA, answerB, answerYesVariant, answerNoVariant]
    }
    
    func isAbQuest(_ quest: Quest) -> Bool {
        guard !quest.answers.isEmpty else {
            return false
        }
        
        let isHaveOtherAnswer = quest.answers.filter {
            !answers.contains($0)
        }
            .count > 0
        return !isHaveOtherAnswer
    }
    
    func format(_ tempQuest: Quest) -> Quest {
        let answers = formatAnswers(tempQuest)
        
        return Quest(
            id: tempQuest.id,
            quest: tempQuest.quest,
            trueAnswer: tempQuest.trueAnswer,
            answers: answers,
            complexity: tempQuest.complexity,
            category: tempQuest.category,
            section: tempQuest.section
        )
    }
    
    private func formatAnswers(_ quest: Quest) -> [String] {
        switch defineAbType(quest.answers) {
        case .classic:
            return classicAnswers
        case .variant:
            return varaintAnswers
        }
    }
    
    private func defineAbType(_ answers: [String]) -> AbType {
        if answers.contains(answerYesVariant) && answers.contains(answerNoVariant) {
            return .variant
        } else {
            return .classic
        }
    }
}
