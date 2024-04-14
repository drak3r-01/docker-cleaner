# Docker Cleaner

<div align="center">

```markdown
 ______                   __                          ______  __                                      
|_   _ `.                [  |  _                    .' ___  |[  |                                     
  | | `. \  .--.   .---.  | | / ] .---.  _ .--.    / .'   \_| | | .---.  ,--.   _ .--.  .---.  _ .--. 
  | |  | |/ .'`\ \/ /'`\] | '' < / /__\\[ `/'`\]   | |        | |/ /__\\`'_\ : [ `.-. |/ /__\\[ `/'`\]
 _| |_.' /| \__. || \__.  | |`\ \| \__., | |       \ `.___.'\ | || \__.,// | |, | | | || \__., | |    
|______.'  '.__.' '.___.'[__|  \_]'.__.'[___]       `.____ .'[___]'.__.'\'-;__/[___||__]'.__.'[___]   
```

<img src="logo.jpg" alt="Docker Cleaner" width="400" height="400">

*Generate by [![DALL-E 3](https://img.shields.io/badge/DALL--E%203-OpenAI-%233171E3)](https://openai.com)

![CMD](https://img.shields.io/badge/language-CMD-blue?style=flat-square&logo=windows)
![PowerShell](https://img.shields.io/badge/language-PowerShell-blue?style=flat-square&logo=powershell)
![Bash](https://img.shields.io/badge/language-Bash-blue?style=flat-square&logo=gnu-bash)
![Docker](https://img.shields.io/badge/tool-Docker-blue?style=flat-square&logo=docker)

</div>

Docker Cleaner is a set of scripts for cleaning up Docker resources on your local machine. It includes scripts for stopping and removing containers, images, and volumes.

## Features

* Stop and remove all containers
* Remove all images
* Remove all volumes (with confirmation prompt)
* Stop all containers, then remove all containers, images and volumes (with confirmation prompt)

## Usage

### Bash (Linux/Mac)

To use the bash script, run the following command in your terminal:

```bash
./docker-cleaner.sh [--volumes [-f] | --images | --containers | --all [-f] | --help
```

* `--volumes [-f]`: Remove all volumes, without confirmation if `-f` is set
* `--images`: Remove all images
* `--containers`: Stop and remove all containers
* `--all [-f]`: Stop all container, then remove all containers, images and volumes, without confirmation if `-f` is set
* `--help`: Show this help

### CMD (Windows)

To use the CMD script, run the following command in your command prompt:

```cmd
docker-cleaner.cmd [--volumes [-Force]] | --images | --containers | --all [-Force] | --help
```

* `--volumes [-Force]`: Remove all volumes, without confirmation if -Force is set
* `--images`: Remove all images
* `--containers`: Stop and remove all containers
* `--all [-Force]`: Stop all container, then remove all containers, images and volumes, without confirmation if -Force is set
* `--help`: Show this help

**Note:** The `--volumes` option is not available in the CMD script due to limitations in Windows batch.

### PowerShell (Cross-platform)

To use the PowerShell script, run the following command in your PowerShell console:

```powershell
.\docker-cleaner.ps1 [-Command <Command>] [-Force]
```

* `-Command` <Command>: The command to execute. Valid values are `--volumes`, `--images`, `--containers`, `--all`, and `--help`.
* `-Force`: Skip confirmation prompts.
