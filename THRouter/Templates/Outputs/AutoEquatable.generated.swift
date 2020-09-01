// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable all
private func compareOptionals<T>(lhs: T?, rhs: T?, compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    switch (lhs, rhs) {
    case let (lValue?, rValue?):
        return compare(lValue, rValue)
    case (nil, nil):
        return true
    default:
        return false
    }
}

private func compareArrays<T>(lhs: [T], rhs: [T], compare: (_ lhs: T, _ rhs: T) -> Bool) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (idx, lhsItem) in lhs.enumerated() {
        guard compare(lhsItem, rhs[idx]) else { return false }
    }

    return true
}


// MARK: - AutoEquatable for classes, protocols, structs
// MARK: - EquatableModel AutoEquatable
extension EquatableModel: Equatable {}
func == (lhs: EquatableModel, rhs: EquatableModel) -> Bool {
    guard lhs.uuid == rhs.uuid else { return false }
    guard lhs.name == rhs.name else { return false }
    guard lhs.tel == rhs.tel else { return false }
    guard compareOptionals(lhs: lhs.sex, rhs: rhs.sex, compare: ==) else { return false }
    guard compareOptionals(lhs: lhs.address, rhs: rhs.address, compare: ==) else { return false }
    return true
}

// MARK: - AutoEquatable for Enums
