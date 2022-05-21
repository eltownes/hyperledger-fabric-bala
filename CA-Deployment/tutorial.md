# tutorial

to use meld for folder comparison:
- `mkdir $HOME/Desktop/meld`
- can use copy to setup comparison BEFORE a command execution
    - `cp -r $HOME/Desktop/hyperledger-fabric-bala/CA-Deployment/ $HOME/Desktop/meld`
- then use meld to 'diff' the folders

### client
from 'CA-Deployment':
- `mkdir fabric-ca-client`
- `cd fabric-ca-client`
- `mkdir tls-ca org1-ca int-ca`
- `cp ../bin/fabric-ca-client .`
- `mkdir tls-root-cert`
- `mkdir fabric-ca-server-tls`

### tls
from 'CA-Deployment'
- `mkdir fabric-ca-server-tls`
- `cd fabric-ca-server-tls/`
- `cp ../bin/fabric-ca-server .`
- setup meld compare?
- `./fabric-ca-server init -b tls-admin:tls-adminpw`
- modify 'fabric-ca-server-config.yaml' and delete crypto
    - `rm -rf ca-cert.pem msp/`
- `./fabric-ca-server start`

### client
from 'fabric-ca-client'
- `cp ../fabric-ca-server-tls/ca-cert.pem ./tls-root-cert/tls-ca-cert.pem`
- `export FABRIC_CA_CLIENT_HOME=$PWD`
- `./fabric-ca-client enroll -d \
        -u https://tls-admin:tls-adminpw@alex-VB:7054 \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --enrollment.profile tls \
        --mspdir tls-ca/tlsadmin/msp`

- `./fabric-ca-client register -d \
        -u https://alex-VB:7054  \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --id.name rcaadmin \
        --id.secret rcaadminpw \
        --mspdir tls-ca/tlsadmin/msp`
- `./fabric-ca-client enroll -d \
        -u https://rcaadmin:rcaadminpw@alex-VB:7054 \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --enrollment.profile tls \
        --csr.hosts 'host1,alex-VB' \
        --mspdir tls-ca/rcaadmin/msp`
- rename to key.pem?

- `./fabric-ca-client register -d \
        -u https://alex-VB:7054\
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --id.name icaadmin \
        --id.secret icaadminpw \
        --mspdir tls-ca/tlsadmin/msp`
- `./fabric-ca-client enroll -d \
        -u https://icaadmin:icaadminpw@alex-VB:7054 \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --enrollment.profile tls \
        --csr.hosts 'host1,alex-VB' \
        --mspdir tls-ca/icaadmin/msp`
- rename to key.pem?

# org1
from from 'CA-Deployment'
- `mkdir fabric-ca-server-org1`
- `cd fabric-ca-server-org1`
- `cp ../bin/fabric-ca-server .`
- `mkdir tls`
- `cp ../fabric-ca-client/tls-ca/rcaadmin/msp/signcerts/cert.pem tls && \
        cp ../fabric-ca-client/tls-ca/rcaadmin/msp/keystore/key.pem tls`
- `./fabric-ca-server init -b rcaadmin:rcaadminpw`
- modify 'fabric-ca-server-config.yaml' and delete crypto
    - `rm -rf ca-cert.pem msp/`
- `./fabric-ca-server start`


# TMUX NOTE - periodically check environment
- `env | grep fabric`
- `export FABRIC_CA_CLIENT_HOME=$PWD`


- `./fabric-ca-client enroll -d \
        -u https://rcaadmin:rcaadminpw@alex-VB:7055 \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --mspdir org1-ca/rcaadmin/msp`

# intermediate CA
- `./fabric-ca-client register \
        -u https://alex-VB:7055  \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --id.name icaadmin \
        --id.secret icaadminpw \
        --id.attrs '"hf.Registrar.Roles=user,admin"' \
        --id.attrs '"hf.Revoker=true","hf.IntermediateCA=true"' \
        --mspdir org1-ca/rcaadmin/msp`

from from 'CA-Deployment'
- `mkdir fabric-ca-server-int-ca`
- `cd fabric-ca-server-int-ca`
- `cp ../bin/fabric-ca-server .`
- `mkdir tls`
- `cp ../fabric-ca-client/tls-ca/icaadmin/msp/signcerts/cert.pem tls && \
        cp ../fabric-ca-client/tls-ca/icaadmin/msp/keystore/key.pem tls`
- `cp ../fabric-ca-server-tls/ca-cert.pem tls/tls-ca-cert.pem`

- `./fabric-ca-server init -b icaadmin:icaadminpw`
- modify 'fabric-ca-server-config.yaml' and delete crypto
    - `rm -rf ca-cert.pem msp/`
- `./fabric-ca-server start`

# TMUX NOTE - periodically check environment
- `env | grep fabric`
- `export FABRIC_CA_CLIENT_HOME=$PWD`

- `./fabric-ca-client enroll -d \
        -u https://icaadmin:icaadminpw@alex-VB:7056 \
        --tls.certfiles tls-root-cert/tls-ca-cert.pem \
        --csr.hosts 'host1,alex-VB' \
        --mspdir int-ca/icaadmin/msp`




- `openssl crl -inform PEM -text -in crl.pem`
