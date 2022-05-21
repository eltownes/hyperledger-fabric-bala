# Getting Started

## 1 of 2 - on Windows host setup the VM environment

### VirtualBox
- Install [VirtualBox](https://www.virtualbox.org/)
- Maintain a fully updated 'base' VM
    - Ubuntu xx.xx LTS
    - periodically run `sudo apt update && sudo apt full-upgrade -y`

#### Setup test VM
- Clone 'base' VM for the minifabric test environment
- Launch this clone VM as the playground

## 2 of 2 - setup the Linux environment

### Prerequisites
- install git and curl
    - run `sudo apt install git && sudo apt install curl`
- navigate to a desired directory from which to work
- clone repo
    - run `git clone https://github.com/eltownes/hyperledger-fabric-bala.git`
- change to `CA-Deployment` directory
- make scripts executable
    - run `chmod +x *.sh`
- look at scripts to see what gets installed and make changes if necessary
- install the prereq* scripts
    - run `./prereq-1-basic.sh`
    - etc
