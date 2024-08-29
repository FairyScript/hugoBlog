$postName = $args[0]
$hugoCommand = "hugo new content content/post/$postName/index.md"
Invoke-Expression $hugoCommand