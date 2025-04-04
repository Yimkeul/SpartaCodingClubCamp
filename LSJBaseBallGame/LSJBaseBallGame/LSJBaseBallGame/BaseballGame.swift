//
//  BaseballGame.swift
//  LSJBaseBallGame
//
//  Created by yimkeul on 3/10/25.
//

import Foundation

class BaseballGame {

    private let maxLength: Int
    private var isAnswer: Bool
    private var isQuit: Bool
    private var answer: [String]
    private let recordManager: RecordManager
    private var previousTryAnser: Set<String>

    init() {
        maxLength = 3
        isAnswer = false
        answer = []
        isQuit = false
        recordManager = RecordManager.shared
        previousTryAnser = []
    }

    func start() {
        while !isQuit {
            // Lv4: 프로그램 시작시 안내문구 출력
            print(MessageContents.welcomMessage)

            guard let input = readLine(), let intInput = Int(input), let choice = NumberType(rawValue: intInput) else {
                print(MessageContents.incorrectNumberMessage)
                continue
            }

            switch choice {
            case .gameStart:
                gameStart()
            case .history:
                showHistory()
            case .quit:
                quit()
            }
        }

    }

    private func gameStart() {
        resetGame()
        print(MessageContents.startMessage)

        var tryCount = 0

        while !isAnswer {
            print(MessageContents.inputNumberMessage)

            if let line = readLine() {
                let input = line.compactMap { String($0) }
                
                // MARK: 이전에 입력한 기록이 있는 경우 추가 안내문 출력
                if previousTryAnser.contains(line) {
                    print(MessageContents.previousInputMessage)
                }

                if checkError(for: input) == .error {
                    print(MessageContents.incorrectInputMessage)
                } else {
                    tryCount += 1
                    previousTryAnser.insert(line)
                    print("\(checkHint(for: input, to: tryCount))\n")
                }
            }
        }
    }


    private func resetGame() {
        answer = makeAnswer()
        isAnswer = false
    }

    // Lv5: 기록보기
    private func showHistory() {
        recordManager.showHistory()
    }

    // Lv6: 종료하기
    private func quit() {
        isQuit = true
        print(MessageContents.finishGameMessage)
    }

    // Lv1: 1에서 9까지의 서로 다른 임의의 수 3자리 구하기
    // Lv3: 0에서 9까지로 변경, 맨 앞자리, 중복 제외
    private func makeAnswer() -> [String] {

        var numbers = [Int]()

        while numbers.count < maxLength {
            // 1에서 9까지 랜덤 수 추출
            let randomNumber = numbers.isEmpty ? Int.random(in: 1...9) : Int.random(in: 0...9)

            // 중복인 경우 추가 안함
            if !numbers.contains(randomNumber) {
                numbers.append(randomNumber)
            }
        }
        return numbers.map { String($0) }
    }

    // Lv2: 올바르지 않은 입력값 체크
    // Lv3: 0 사용 가능
    private func checkError(for input: [String]) -> ErrorType {

        // 입력한 데이터가 숫자 외 다른 형식이 포함되어 있는 경우
        let hasNonDigit = !input.joined().allSatisfy { $0.isNumber }

        // 숫자가 중복되어 있는 경우, 입력한 데이터가 세자리인지 동시 확인 가능
        let hasDuplicateNumbers = Set(input).count != maxLength

        // 0이 사용된 경우
        // let containsZero = input.contains("0")

        if hasNonDigit || hasDuplicateNumbers /*|| containsZero*/ {
            return .error
        }

        return .success
    }

    // Lv2: 정답 확인을 위한 힌트
    private func checkHint(for input: [String], to count: Int) -> String {

        var hint = Hint()

        for i in 0 ..< maxLength {
            // 스트라이크, 볼 판별기
            if answer.contains(input[i]) {
                if input[i] == answer[i] {
                    hint.strikeCount += 1
                } else {
                    hint.ballCount += 1
                }
            }
        }

        if hint.isThreeStrike {
            isAnswer = true
            recordManager.saveCount(count)
            return MessageContents.correctAnswerMessage
        }

        if hint.isZeroCount {
            return MessageContents.nothingMessage
        } else {
            var result = ""
            result += hint.strikeCount != .zero ? "\(hint.strikeCount)스트라이크 " : ""
            result += hint.ballCount != .zero ? "\(hint.ballCount)볼" : ""
            return result
        }
    }
}
