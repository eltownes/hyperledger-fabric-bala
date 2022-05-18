# Notes

- `utils.sh`
    - script to implement shortcuts & tools
- Display running containers
    - `docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"`
    - too long? : `alias u-dt='docker ps --format "table {{.ID}}\t{{.Names}}"'`
- Execute `ls` on the cli container
    - `docker exec cli ls`
- Enter peer container
    - `docker exec -it [id] sh`
- Pull out stuff from `cli` container and into the 'pulled' dir
    - general:
        - create pulled: `mkdir ~/Desktop/pulled`
        - set cliPath: `cliPath=$(docker exec cli pwd)`
        - copy: `docker cp cli:$cliPath/ ~/Desktop/pulled/`
    - environment: `docker exec cli env > ~/Desktop/pulled/env.yaml`
- Find text in files
    - `grep -rni "bccsp" ~/Desktop/pulled`
- File differences
    - `diff -y docker-compose.yml docker-compose-lab1.yml`
- New prompt
    - `export PS1='\w \! # '`
- Container environment?
    - running? : `cat /etc/os-release`
    - size? : `du -sh`
    - programs? : `ls -a /bin`

