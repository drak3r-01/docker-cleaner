param(
    [Parameter(Mandatory=$false)]
    [ValidateSet('--volumes', '--images', '--containers', '--all', '--help')]
    [string]$Command,

    [Parameter(Mandatory=$false)]
    [switch]$Force
)

function Stop-Containers {
    Write-Host "Stop all Containers"
    docker ps -q | ForEach-Object { docker stop $_ }
}

function Remove-Containers {
    Write-Host "Remove all Containers"
    docker container prune -f
}

function Remove-Images {
    Write-Host "Remove all Images"
    docker images -q | ForEach-Object { docker image rm -f $_ }
}

function Remove-Volumes {
    param(
        [switch]$Force
    )

    Write-Host "Remove all Volumes"
    if (-not $Force) {
        Write-Host "Warning : all Data from Databases will be deleted !"
        $response = Read-Host "Do you want to remove All Volumes (Yes/yes/Y/y/Oui/oui/O/o)?"
        $response = $response.ToLower()
        if ($response -notin 'yes', 'y', 'o', 'oui') {
            Write-Host "Volumes are kept"
            return
        }
    }

    docker volume ls -q | ForEach-Object { docker volume rm -f $_ }
}

function Remove-All {
    param(
        [switch]$Force
    )

    Write-Host "Remove All Docker's Ressources : Container - Images - Volumes"
    Stop-Containers
    Remove-Containers
    Remove-Images
    Remove-Volumes -Force:$Force
}

switch ($Command) {
    '--volumes' { Remove-Volumes -Force:$Force }
    '--images' { Remove-Images }
    '--containers' { Remove-Containers }
    '--all' { Remove-All -Force:$Force }
    default { Write-Host "Usage: $PSCommandPath [--volumes [-Force]] | --images | --containers | --all [-Force] | --help" }
}