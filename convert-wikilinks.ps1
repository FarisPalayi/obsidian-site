$source = "C:\Users\acer\Documents\Obsidian\MCA"
$target = "C:\Users\acer\Coding\Lab\obsidian-site\content\docs"


if (-not $target.Contains("obsidian-site")) {
    throw "Target path safety check failed"
}

Remove-Item $target -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item $source $target -Recurse

Get-ChildItem $target -Recurse -Filter *.md | ForEach-Object {
    $lines = Get-Content $_.FullName
    $inCodeBlock = $false
    $out = @()

    foreach ($line in $lines) {
        if ($line -match '^```') {
            $inCodeBlock = -not $inCodeBlock
            $out += $line
            continue
        }

        if ($inCodeBlock) {
            $out += $line
            continue
        }

        # [[note|alias]]
        $line = $line -replace '\[\[([^#\]|]+)(#[^\]|]+)?\|([^\]]+)\]\]', {
            $note = $matches[1]
            $heading = $matches[2]
            $alias = $matches[3]
            $url = [uri]::EscapeUriString($note)
            "[$alias]($url.md$heading)"
        }

        # [[note]]
        $line = $line -replace '\[\[([^#\]|]+)(#[^\]]+)?\]\]', {
            $note = $matches[1]
            $heading = $matches[2]
            $url = [uri]::EscapeUriString($note)
            "[$note]($url.md$heading)"
        }

        $out += $line
    }

    Set-Content $_.FullName $out
}

