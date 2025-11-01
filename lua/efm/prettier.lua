return {
    formatCommand = ([[
        prettier
        --stdin-filepath ${INPUT}
        ${--config-precedence:configPrecedence}
        ${--tab-width:tabWidth}
        ${--single-quote:singleQuote}
        ${--trailing-comma:trailingComma}
    ]]):gsub(
        "\n",
        ""
    ),
    formatStdin = true
}
