# Blog Development Environment Setup Script
# For Hugo static site with LoveIt theme

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Hugo Blog Development Environment Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Function to check if running as administrator
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Function to refresh environment variables
function Update-EnvironmentPath {
    $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH","User")
}

Write-Host "Checking prerequisites..." -ForegroundColor Yellow

# Check if Git is installed
try {
    $gitVersion = git --version
    Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed or not in PATH" -ForegroundColor Red
    Write-Host "Please install Git from https://git-scm.com/" -ForegroundColor Red
    exit 1
}

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "✗ Not in a git repository" -ForegroundColor Red
    exit 1
}

Write-Host "✓ In git repository" -ForegroundColor Green

# Initialize git submodules (because someone always forgets this)
Write-Host "Initializing git submodules..." -ForegroundColor Yellow
try {
    git submodule update --init --recursive
    Write-Host "✓ Git submodules initialized" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to initialize git submodules" -ForegroundColor Red
    exit 1
}

# Check if Hugo is installed
Write-Host "Checking Hugo installation..." -ForegroundColor Yellow
Update-EnvironmentPath

try {
    $hugoVersion = hugo version
    Write-Host "✓ Hugo is already installed: $hugoVersion" -ForegroundColor Green
} catch {
    Write-Host "Hugo not found. Installing Hugo Extended..." -ForegroundColor Yellow
    
    # Check if running as admin for winget
    if (-not (Test-Administrator)) {
        Write-Host "Administrator privileges required for Hugo installation." -ForegroundColor Yellow
        Write-Host "Please run this script as Administrator or install Hugo manually." -ForegroundColor Yellow
        
        # Try to install anyway (winget sometimes works without admin)
        try {
            winget install Hugo.Hugo.Extended --silent
            Write-Host "✓ Hugo installed successfully" -ForegroundColor Green
        } catch {
            Write-Host "✗ Failed to install Hugo. Please install manually:" -ForegroundColor Red
            Write-Host "  1. Run PowerShell as Administrator" -ForegroundColor Red
            Write-Host "  2. Run: winget install Hugo.Hugo.Extended" -ForegroundColor Red
            Write-Host "  3. Or download from: https://github.com/gohugoio/hugo/releases" -ForegroundColor Red
            exit 1
        }
    } else {
        try {
            winget install Hugo.Hugo.Extended --silent
            Write-Host "✓ Hugo installed successfully" -ForegroundColor Green
        } catch {
            Write-Host "✗ Failed to install Hugo via winget" -ForegroundColor Red
            Write-Host "Please install Hugo manually from: https://github.com/gohugoio/hugo/releases" -ForegroundColor Red
            exit 1
        }
    }
    
    # Refresh PATH after installation
    Update-EnvironmentPath
    
    # Verify installation
    try {
        $hugoVersion = hugo version
        Write-Host "✓ Hugo verification successful: $hugoVersion" -ForegroundColor Green
    } catch {
        Write-Host "✗ Hugo installation verification failed" -ForegroundColor Red
        Write-Host "You may need to restart your terminal or computer" -ForegroundColor Yellow
        Write-Host "Try running this script again after restarting" -ForegroundColor Yellow
        exit 1
    }
}

# Check if theme exists
Write-Host "Checking theme installation..." -ForegroundColor Yellow
if (Test-Path "themes/LoveIt" -and (Get-ChildItem "themes/LoveIt" | Measure-Object).Count -gt 0) {
    Write-Host "✓ LoveIt theme is installed" -ForegroundColor Green
} else {
    Write-Host "✗ LoveIt theme is missing or empty" -ForegroundColor Red
    Write-Host "This should have been fixed by git submodule init, but apparently not..." -ForegroundColor Red
    exit 1
}

# Test build
Write-Host "Testing Hugo build..." -ForegroundColor Yellow
try {
    $buildOutput = hugo --quiet
    Write-Host "✓ Hugo build successful" -ForegroundColor Green
} catch {
    Write-Host "✗ Hugo build failed" -ForegroundColor Red
    Write-Host "Check your hugo.toml configuration" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "To start the development server:" -ForegroundColor Cyan
Write-Host "  hugo server" -ForegroundColor White
Write-Host ""
Write-Host "Your blog will be available at:" -ForegroundColor Cyan
Write-Host "  http://localhost:1313/" -ForegroundColor White
Write-Host ""
Write-Host "To create a new blog post:" -ForegroundColor Cyan
Write-Host "  hugo new posts/your-post-name.md" -ForegroundColor White
Write-Host ""
Write-Host "To build for production:" -ForegroundColor Cyan
Write-Host "  hugo --minify" -ForegroundColor White
Write-Host ""
Write-Host "Happy blogging!" -ForegroundColor Yellow