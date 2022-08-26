#!/usr/bin/env bash

argumentNames=("mode" "[script]")
argumentValues=("$@")
nrOfArguments=${#argumentValues[@]}

#  Image

name="jaboo/miw"
version="1.0-debian-slim"
image="${name}:${version}"

if [ $nrOfArguments -lt 1 ]; then
    printf "USAGE: %s %s\n" "$0" "${argumentNames[*]}"
    exit 1;
fi

# Host

hostdirHome="${PWD}"
hostdirNotebooks="${hostdirHome}/notebooks"
hostdirPics="${hostdirHome}/pics"
hostdirProjects="${hostdirHome}/projects"
hostdirScripts="${hostdirHome}/scripts"

function makeWindowsProof {
    hostdirNotebooks=$(cygpath -w -p ${hostdirNotebooks})
    hostdirProjects=$(cygpath -w -p ${hostdirProjects})
    hostdirPics=$(cygpath -w -p ${hostdirPics})
    hostdirScripts=$(cygpath -w -p ${hostdirScripts})
    dockerPrefix="winpty "
}

function makeMacProof {
    # Support Apple M* processors
    dockerPostfix="--platform linux/amd64"

    # Set global variable DISPLAY to enable X Window System
    hostIP=$(ifconfig | grep 'inet ' | awk '{print $2}' | head -n 1)
    export DISPLAY="${hostIP}:0"
    export LIBGL_ALLOW_SOFTWARE=1
}

dockerPrefix=""
dockerPostfix=""

# Detect OS
unameOut="$(uname -s)"
os="${unameOut:0:7}"
case "${os}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac" && makeMacProof;;
    CYGWIN*)    machine="Cygwin" && makeWindowsProof;;
    MINGW*)     machine="Git Bash" && makeWindowsProof;;
    *)          machine="UNKNOWN:${os}"
esac

export HOSTPATH_NOTEBOOKS=${hostdirNotebooks}
export HOSTPATH_PICS=${hostdirPics}
export HOSTPATH_PROJECT=${hostdirProjects}
export HOSTPATH_SCRIPTS=${hostdirScripts}

# Container

mode="${argumentValues[0]}"

containerName="python-ai-${mode}"
containerHome="/home/student"
containerdirNotebooks="${containerHome}/notebooks"
containerdirProjects="${containerHome}/projects"
containerdirPics="${containerHome}/pics"
containerdirScripts="${containerHome}/scripts"
composePath="docker/compose"
# graphicsParams="-v \"/tmp/.X11-unix:/tmp/.X11-unix\" -e \"DISPLAY=${hostIP}:0\" --net=host --add-host=host.docker.internal:host-gateway"
graphicsParams="-v \"/tmp/.X11-unix:/tmp/.X11-unix\" -e \"DISPLAY=${DISPLAY}\" --net=host"

cmd="${dockerPrefix}docker run ${dockerPostfix} -it --rm --name ${containerName}"
cmd="${cmd} -v \"${hostdirNotebooks}:${containerdirNotebooks}\""
cmd="${cmd} -v \"${hostdirPics}:${containerdirPics}\""
cmd="${cmd} -v \"${hostdirProjects}:${containerdirProjects}\""
cmd="${cmd} -v \"${hostdirScripts}:${containerdirScripts}\""
cmd="${cmd} ${graphicsParams}"

case "${mode}" in
    bash*)
        entryPoint="bash"
        cmd="${cmd} --entrypoint ${entryPoint} ${image}";;
    jupyter*)
        version="latest"     
        composefile="${composePath}/python-ai-jupyter.yaml"
        export IMAGE=${image}
        export CONTAINER_NAME=${containerName}
        cmd="docker/compose/up.sh ${composefile}";;
    python-repl*)
        entryPoint="ptpython"
        cmd="${cmd} --entrypoint ${entryPoint} ${image}";;        
    python-script*)
        entryPoint="run_script"
        cmd="${cmd} -e SCRIPT=\"${argumentValues[1]}\" --entrypoint ${entryPoint} ${image}";;
    # Default
    *)      
        cmd="${cmd} ${image}";;        
esac

printf "%s cmd : \n\t%s\n\n" "$0" "${cmd}"
eval ${cmd}
