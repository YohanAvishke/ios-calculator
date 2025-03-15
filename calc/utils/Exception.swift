enum CalculatorCoreError: Error {
    case invalidNumberofArguments
    case invalidOperator
}

enum DivisionError: Error {
    case dividedByZero
}

enum ModulusError: Error {
    case dividedByZero
}
