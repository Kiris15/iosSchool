//
//  TeestGame.swift
//  iosSchool
//
//  Created by Savely on 17.03.2023.
//

import Foundation

protocol Creature {
  var attack: Int { get }
  var health: Int { get set }
  var damage: [Int] { get set }

  func attackPower(protect: Int) -> Int
  func getDefense() -> Int
}

class Player: Creature {

  var attack: Int
  var defense: Int
  var health: Int
  var damage: [Int]
  var maxHealth: Int
  var healthPoision: Int
  var difficulty: Difficulty

  init?(attack: Int, defence: Int, diapazoneMin: Int, diapazoneMax: Int, difficulty: Difficulty) {

    let isDataCorrect = DataChecker().checkData(attack: attack,
                                  defence: defence,
                                  diapazoneMin: diapazoneMin,
                                  diapazoneMax: diapazoneMax)
    if !isDataCorrect {
      return nil
    }

    self.attack = attack
    self.defense = defence
    self.health = diapazoneMax
    self.damage = []
    self.maxHealth = diapazoneMax
    self.healthPoision = 3
    self.difficulty = difficulty

    for counter in diapazoneMin...diapazoneMax {
      damage.append(counter)
    }
  }

  func getDefense() -> Int {
    return defense
  }

  private func modifiedAttack(protect: Int) -> Int {
    let attackMod = self.attack - protect + 1
    if attackMod > 0 {
      return attackMod
    } else {
      return 1
    }
  }

  func attackPower(protect: Int) -> Int {
    let countOfTries = modifiedAttack(protect: protect)
    var throwingResult = [Int()]
    for _ in 1...countOfTries {
      let cube = Int.random(in: 1..<7)
      throwingResult.append(cube)
    }
    if throwingResult.contains(5) || throwingResult.contains(6) {
      return self.damage.randomElement() ?? 0
    } else {
      return 0
    }
  }

  func healing() {
    if healthPoision > 0 {
      self.health +=  maxHealth / (100 / difficulty.rawValue)
      self.healthPoision -= 1
      if health > maxHealth {
        health = maxHealth
      }
    } else {
      print("You're out of health Poision")
    }
  }
}

enum Difficulty: Int {
  case easy = 10
  case middle = 25
  case hard = 50
}

struct Monster: Creature {

  var attack: Int
  var defense: Int?
  var health: Int
  var damage: [Int]

  init?(attack: Int, defence: Int?, diapazoneMin: Int, diapazoneMax: Int) {

    let isDataCorrect = DataChecker().checkData(attack: attack,
                                  defence: defence ?? 0,
                                  diapazoneMin: diapazoneMin,
                                  diapazoneMax: diapazoneMax)
    if !isDataCorrect {
      return nil
    }

    self.attack = attack
    self.defense = defence
    self.health = diapazoneMax
    self.damage = []

    for counter in diapazoneMin...diapazoneMax {
      damage.append(counter)
    }
  }

  func getDefense() -> Int {
    return defense ?? 0
  }

 private func modifiedAttack(protect: Int) -> Int {
    let attackMod = self.attack - protect + 1
    if attackMod > 0 {
      return attackMod
    } else {
      return 1
    }
  }

  func attackPower(protect: Int) -> Int {
    let countOfTries = modifiedAttack(protect: protect)
    var throwingResult = [Int()]
    for _ in 1...countOfTries {
      let cube = Int.random(in: 1..<7)
      throwingResult.append(cube)
    }
    if throwingResult.contains(5) || throwingResult.contains(6) {
      return self.damage.randomElement() ?? 0
    } else {
      return 0
    }
  }
}

class CreatureWrapper {
  var creature: Creature

  init(creature: Creature) {
    self.creature = creature
  }
}

class DataChecker {

  func checkData(attack: Int, defence: Int, diapazoneMin: Int, diapazoneMax: Int) -> Bool {
    if attack < 1 || attack > 20 {
      print("Attack should be from 1 to 20")
      return false
    }
    if defence < 1 || defence > 20 {
      print("Defence should be from 1 to 20")
      return false
    }
    if diapazoneMin < 1 || diapazoneMin > diapazoneMax {
      print("M should be more than 0 and smaller than N")
      return false
    }
    if diapazoneMax < 1 {
      print("N should be more than 0")
      return false
    }
    return true
  }
}

class Arena {

  func fight(creatureFirst: CreatureWrapper, creatureSecond: CreatureWrapper) {
    let creatureFirstHit = creatureFirst.creature.attackPower(protect: creatureSecond.creature.getDefense())
    creatureSecond.creature.health -= creatureFirstHit
    let creatureSecondHit = creatureSecond.creature.attackPower(protect: creatureFirst.creature.getDefense())
    creatureFirst.creature.health -= creatureSecondHit
    if creatureSecond.creature.health <= 0 {
      print("creatureSecond is dead. creatureFirst wins")
    }
    if creatureFirst.creature.health <= 0 {
      print("creatureFirst is dead. creatureSecond wins")
    }
  }
}

class Example {
  // Пример использования
  let arena = Arena()

  func doExample() {
    if let player = Player(attack: 20, defence: 20, diapazoneMin: 1, diapazoneMax: 6, difficulty: .easy),
       let monster = Monster(attack: 20, defence: 20, diapazoneMin: 1, diapazoneMax: 6) {
      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)

      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)

      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)

      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)

      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)

      arena.fight(creatureFirst: CreatureWrapper(creature: player), creatureSecond: CreatureWrapper(creature: monster))
      print(player.health, monster.health)
      player.healing()
      print(player.health, monster.health)
    }
  }
    }
