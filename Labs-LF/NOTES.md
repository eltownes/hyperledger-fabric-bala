# Notes

- Running containers
    - `docker ps --format "table {{.ID}}\t{{.Names}}"`
    - too long? : `alias dct='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}"'`
- Execute `ls` on the cli container
    - `docker exec cli ls`
- Pull out stuff from cli container and into the 'pulled' dir
    - create pulled: `mkdir ~/Desktop/pulled`
    - set cliPath: `cliPath=$(docker exec cli pwd)`
    - copy: `docker cp cli:$cliPath/ ~/Desktop/pulled/`
    - env: `docker exec cli env > ~/Desktop/pulled/env.txt`
- Enter cli container
    - `docker exec -it cli bash` 
- New prompt
    - `export PS1='\w \! # '`
    - fun?
        - running? : `cat /etc/os-release`
        - size? : `du -sh`
        - programs? : `ls -a /bin`

