module.exports = {
    verbose: true,
    collectCoverage: true,
    coverageDirectory: "./test/coverage",
    collectCoverageFrom: ["src/**"],
    coveragePathIgnorePatterns: [],
    coverageThreshold: {
        "global": {
            "statement": 80,
            "functions": 80,
            "lines": 80
        }
    } ,
    coverageReporters: ["lcov", "html"],
    reporters: [
        "default",
        ["./node_modules/jest-html-reporter", {
            "pageTitle": "Test report",
            "outputPath": "test/unit-test-report.html"
        }]
    ],
    testPathIgnorePatterns: ["node_modules"],
    testResultsProcessor: "./node_modules/jest-html-reporter"
};