# Ambient Canvas Background Architect - Global Auto Installer for Antigravity & Agent IDEs
$ErrorActionPreference = "Stop"

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "  Installing ambient-canvas-background-architect Skill    " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

$globalSkillsDir = "$env:USERPROFILE\.gemini\config\skills"
$targetDir = Join-Path $globalSkillsDir "ambient-canvas-background-architect"
$aliasDir = Join-Path $globalSkillsDir "ambient-bg"

# Create directories
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
New-Item -ItemType Directory -Force -Path $aliasDir | Out-Null

$baseUrl = "https://raw.githubusercontent.com/riyaazad143-rgb/ambient-canvas-background-architect/main"

Write-Host "[*] Downloading SKILL.md..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "$baseUrl/SKILL.md" -OutFile (Join-Path $targetDir "SKILL.md") -UseBasicParsing

Write-Host "[*] Configuring alias 'ambient-bg'..." -ForegroundColor Yellow
Invoke-WebRequest -Uri "$baseUrl/ambient-bg/SKILL.md" -OutFile (Join-Path $aliasDir "SKILL.md") -UseBasicParsing

# Also setup in current workspace if inside a project
if (Test-Path ".git" -Or Test-Path "package.json") {
    $workspaceSkills = ".agents\skills\ambient-canvas-background-architect"
    New-Item -ItemType Directory -Force -Path $workspaceSkills | Out-Null
    Copy-Item (Join-Path $targetDir "SKILL.md") -Destination (Join-Path $workspaceSkills "SKILL.md") -Force
    Write-Host "[+] Also mirrored to workspace: $workspaceSkills" -ForegroundColor Green
}

Write-Host "[SUCCESS] Skill installed globally to: $targetDir" -ForegroundColor Green
Write-Host "[SUCCESS] You can now use /ambient-canvas-background-architect or /ambient-bg in Antigravity or any IDE!" -ForegroundColor Cyan
