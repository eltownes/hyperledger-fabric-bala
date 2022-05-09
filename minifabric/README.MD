# Getting Started

## 1 of 3 - on Windows host setup the VM environment

### VirtualBox
- Install [VirtualBox](https://www.virtualbox.org/)
- Maintain a fully updated 'base' VM
    - Ubuntu 20.04.4 LTS (Focal Fossa)
    - periodically run `sudo apt update && sudo apt full-upgrade -y`

#### Setup test VM
- Clone 'base' VM for the minifabric test environment
- Launch this clone VM as the minifabric playground

## 2 of 3 - setup the Linux environment

### Prerequisites
- install git and curl
    - run `sudo apt install git && sudo apt install curl`
- navigate to a desired directory from which to work
- clone repo
    - run `git clone https://github.com/eltownes/hyperledger-fabric-bala.git`
- navigate to minifabric folder
- make script executable
    - run `chmod +x prereq-docker.sh`
- install Docker
    - run `prereq-docker.sh`

## 3 of 3 - setup the minifabric environment

- Consult and follow the guide:
    - [Minifabric GitHub - intro](https://github.com/hyperledger-labs/minifabric)
    - [Minifabric GitHub - tutorial](https://github.com/hyperledger-labs/minifabric/blob/main/docs/README.md)
- to add current directory to PATH
    - export PATH=${PWD}:$PATH

