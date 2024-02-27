return {
    -- lintCommand = "erblint  --format compact ~/projects/rails/sample_app/app/views/static_pages/home.html.erb",
    -- lintCommand = "erb -x -T - | ruby -c",
    lintCommand = "erblint --format compact",
    -- lintStdin = true,
    lintOffset = 0,
    formatCommand = "htmlbeautifier",
    -- formatCommand = "erblint -s ~/projects/rails/sample_app/app/views/static_pages/home.html.erb -a",
    formatStdin = true,
    lintIgnoreExitCode = true,
}
