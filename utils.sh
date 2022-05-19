#!/bin/bash

function uf-alias(){
    #
    alias ua-doctbl='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"'
}

function uf-cronSave(){
    
    # https://www.baeldung.com/linux/pipe-output-to-function

    mainDir="$HOME/Desktop/Containers-Info/"$(date '+%y-%m-%d-%H:%M:%S-?')
    mkdir $mainDir

    #
    cat > $mainDir/data.txt

}

function uf-copyDockerDirectory(){

    #
    if [[ $# -eq 0 ]]; then
        echo 'Need at least 1 container name'
        echo 'Example'
        echo '- copyDockerDirectory cli'
        echo '- copyDockerDirectory $(docker ps --format "{{.Names}}")'
        echo '- copyDockerDirectory $(docker ps --format "{{.Names}}" | grep peer)'
        echo
        return 1
    fi

    mainDir="$HOME/Desktop/Containers-Info/"$(date '+%y-%m-%d-%H:%M:%S--?')

    #
    caDir="$mainDir/ca"
        mkdir -p $caDir/etc/hyperledger
    #
    ordererDir="$mainDir/orderer"
        mkdir -p $ordererDir/etc/hyperledger
        mkdir -p $ordererDir/var/hyperledger
    #
    peerDir="$mainDir/peer"
        mkdir -p $peerDir/etc/hyperledger
        mkdir -p $peerDir/var/hyperledger
    #
    cliDir="$mainDir/cli"
        mkdir -p $cliDir

    for i do
        case $i in
        
            *"ca"*)
                echo "# Copying "$i
                docker cp $i:/etc/hyperledger $caDir/etc/hyperledger/$i
                docker exec $i env > $caDir/env.yaml
            ;;

            *"orderer"*)
                echo "# Copying "$i                
                docker cp $i:/etc/hyperledger $ordererDir/etc/hyperledger/$i
                docker cp $i:/var/hyperledger $ordererDir/var/hyperledger$i
                docker exec $i env > $ordererDir/env.yaml
            ;;

            *"peer"*)
                echo "# Copying "$i                
                docker cp $i:/etc/hyperledger $peerDir/etc/hyperledger/$i
                docker cp $i:/var/hyperledger $peerDir/var/hyperledger/$i
                docker exec $i env > $peerDir/env.yaml
            ;;

            *"cli"*)
                echo "# Copying "$i
                docker cp $i:/opt/gopath/src/github.com/ $cliDir
                docker exec $i env > $cliDir/env.yaml
            ;;

            *)
                echo "undefined arguments"
            ;;

        esac
    done

    echo
    echo "Size pulled: " $(du $mainDir -sh)
    echo

}
