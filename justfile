init:
    #!/bin/bash
    mkdir -p ./volumes/app/mattermost/{data,logs,config,plugins}
    sudo chown -R 2000:2000 ./volumes/app/mattermost/
