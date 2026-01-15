# ===============================
# CONFIGURATION
# ===============================

$source = "C:\Users\acer\Documents\Obsidian\MCA"
$target = "C:\Users\acer\Coding\Lab\obsidian-site\content\docs"

# SAFETY CHECK: prevent accidental deletion
if (-not $target.Contains("obsidian-site")) {
    throw "Target path safety check failed"
}

# Remove old converted files safely
Remove-Item $target -Recurse -Force -ErrorAction SilentlyContinue

# Copy all files from Obsidian vault
Copy-Item $source $target -Recurse

# ===============================
# FUNCTIONS
# ===============================

# Converts aliased links [[note|alias]] or [[note#heading|alias]]
function Convert-AliasedLink {
    param($match)
    $note = $match.Groups[1].Value
    $heading = if ($match.Groups.Count -ge 3 -and $match.Groups[2].Success) { $match.Groups[2].Value } else { "" }
    $alias = $match.Groups[3].Value
    $url = [uri]::EscapeUriString($note)
    return "[$alias]($url.md$heading)"
}

# Converts normal links [[note]] or [[note#heading]]
function Convert-NormalLink {
    param($match)
    $note = $match.Groups[1].Value
    $heading = if ($match.Groups.Count -ge 2 -and $match.Groups[2].Success) { $match.Groups[2].Value } else { "" }
    $url = [uri]::EscapeUriString($note)
    return "[$note]($url.md$heading)"
}

# Converts embedded links ![[file]]
function Convert-Embed {
    param($match)
    $file = $match.Groups[1].Value
    return "![]($file)"
}

# ===============================
# PROCESS FILES
# ===============================
Get-ChildItem $target -Recurse -Filter *.md | ForEach-Object {
    $lines = Get-Content $_.FullName
    $inCodeBlock = $false
    $out = @()

    foreach ($line in $lines) {

        # Toggle code block flag
        if ($line -match '^```') {
            $inCodeBlock = -not $inCodeBlock
            $out += $line
            continue
        }

        # Skip conversion inside code blocks
        if ($inCodeBlock) {
            $out += $line
            continue
        }

        # Step 1: Convert embedded links ![[file]]
        $line = [regex]::Replace($line, '!\[\[([^\]|]+)\]\]', { Convert-Embed $_ })

        # Step 2: Convert aliased links [[note|alias]] or [[note#heading|alias]]
        $line = [regex]::Replace($line, '\[\[([^#\]|]+)(#[^\]|]+)?\|([^\]]+)\]\]', { Convert-AliasedLink $_ })

        # Step 3: Convert normal links [[note]] or [[note#heading]]
        $line = [regex]::Replace($line, '\[\[([^#\]|]+)(#[^\]]+)?\]\]', { Convert-NormalLink $_ })

        $out += $line
    }

    # Save the converted file
    Set-Content $_.FullName $out
}
