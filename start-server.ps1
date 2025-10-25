# Start Hugo Development Server

Write-Host "Starting Hugo development server..." -ForegroundColor Cyan
Write-Host ""
Write-Host "Your blog will be available at: http://localhost:1313/" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

# Refresh PATH in case Hugo was just installed
$env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")

try {
    hugo server
} catch {
    Write-Host "Error: Hugo server failed to start" -ForegroundColor Red
    Write-Host "Make sure Hugo is installed and try running .\setup.ps1 first" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
}