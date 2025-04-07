$htmlFile = "Pentair Residentia _Pool Pump Guide.html"
$content = Get-Content $htmlFile -Raw

# Pattern to find all pump details sections
$pattern = '(<div class="pump-details">\s+)<p><strong>Horsepower:</strong>(.*?)</p>\s+<p><strong>Plumbing Size:</strong>(.*?)</p>\s+<p><strong>Replacement Parts(.*?)</strong></p>'

# Replacement with the new structure
$replacement = '$1<div class="pump-specs">' + "`n" + '          <p><strong>Horsepower:</strong>$2</p>' + "`n" + '          <p><strong>Plumbing Size:</strong>$3</p>' + "`n" + '          <p><strong>Replacement Parts$4</strong></p>' + "`n" + '        </div>'

# Apply the replacement
$newContent = $content -replace $pattern, $replacement

# Save the updated content
$newContent | Set-Content $htmlFile -NoNewline

Write-Host "Updated all pump details sections with the new structure."
