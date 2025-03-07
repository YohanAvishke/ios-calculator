extension String {
    var isNumber: Bool {
        return self.range(
            of: "^[+-]?[0-9]+$",
            options: .regularExpression) != nil
    }
}
