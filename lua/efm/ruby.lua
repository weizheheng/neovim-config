return {
    lintCommand = "bundle exec rubocop --format emacs --force-exclusion --stdin ${INPUT}",
    lintOffset = 0,
    lintStdin = true,
    formatCommand = "bundle exec rubocop --auto-correct-all ${INPUT}",
    formatStdin = true,
    lintIgnoreExitCode = true,
}
