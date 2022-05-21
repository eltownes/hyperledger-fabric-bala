# Getting Started

## 1 of 3 - on Windows host setup the VM environment

### VirtualBox
- Install [VirtualBox](https://www.virtualbox.org/)
- Maintain a fully updated 'base' VM
    - Ubuntu xx.xx LTS
    - periodically run `sudo apt update && sudo apt full-upgrade -y`

#### Setup test VM
- Clone 'base' VM for the minifabric test environment
- Launch this clone VM as the playground

## 2 of 3 - setup the Linux environment

### Prerequisites
- install Visual Studio
    - https://code.visualstudio.com/docs/setup/linux
    - run `sudo apt update && sudo snap install code --classic`
    - check `code --version`
- open VS and add 'Desktop' folder to workspace
- install git and curl
    - run `sudo apt install git && sudo apt install curl`
    - check `git --version && curl --version`
- navigate to '$HOME/Desktop'
- clone repo
    - run `git clone https://github.com/eltownes/hyperledger-fabric-bala.git`
- change to 'CA-Deployment' directory
- make scripts executable
    - run `chmod +x *.sh`
- look at scripts to see what gets installed and make changes if necessary
- install the prereq* scripts
    - run `./prereq-1-basic.sh`
    - etc

## 3 of 3 - CA Deployment

### Init
- link:
    - https://hyperledger-fabric-ca.readthedocs.io/en/latest/deployguide/cadeploy.html
- download binaries from:
    - https://github.com/hyperledger/fabric-ca/releases
- move and extract:
    - run `mv $HOME/Downloads/*fabric-ca* .`
    - run `tar -xvf [name].tar.gz`
    - run `tree`:
        .
        ├── README.MD
        ├── bin
        │   ├── fabric-ca-client
        │   └── fabric-ca-server
        ├── hyperledger-fabric-ca-linux-amd64-1.5.3.tar.gz
