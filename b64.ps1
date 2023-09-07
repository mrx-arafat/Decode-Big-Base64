# Read the file line-by-line
Get-Content "encoded.txt" | ForEach-Object {
    $current = $_.Trim()  # Trim the string to remove any extra spaces or newlines
    # Loop 100 times to decode
    1..100 | ForEach-Object {
        $count = $_
        try {
            $bytes = [System.Convert]::FromBase64String($current)
            $current = [System.Text.Encoding]::UTF8.GetString($bytes)
            if ($count -eq 100) {
                Write-Host $current
            }
        } catch {
            Write-Host "Skipping invalid Base64 string and the flag is: $current"
            return  # Skip to the next iteration
        }
    }
}
