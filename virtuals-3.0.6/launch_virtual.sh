#!/bin/bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#################### HELPER ####################
Help() 
{
    echo "  ==================================================="
    echo "  =========> EXOLEGEND Launcher H.E.L.P <============"
    echo "  ==================================================="

    echo "without option            Launch the game, starts all the services"
    echo "-h / --help               Show the help message"
    echo "-v / --version            Show the EXOLEGEND version"
    echo "-r / --verbose            Logs everything"
}
Version() {
    echo "$(./GameMaster --version)"
}
while getopts ":vhr-:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        v) # display version
            Version
            exit;;
        r)
            echo "VERBOSE MODE"
            exit;;
        -)

            case ${OPTARG} in
                "version") 
                    Version
                    exit;;
                "help") 
                    Help
                    exit;;
                "verbose")
                    echo "Verbose mode"
                    exit;;
                ""*)
                    echo "Error: Invalid option"
                    exit;;
            esac;;
        \?) # incorrect option
            echo "Error: Invalid option"
            exit;;
   esac
done



#################### KILLER ####################
# Function to terminate all child processes
function cleanup {
    echo "Cleaning up..."
    pkill -P $$ # Kill all child processes of the current script
    exit 1
}
trap cleanup SIGINT


./kill_virtual.sh
#################### LAUNCHER ####################
echo " ---> WELCOME TO EXOBOT LAUNCHER V1 :D <---"

echo "Running GameMaster Service 1/5 ... "
./GameMaster &
sleep 2

echo "Done."
echo "Running Falcon Service 2/5 ... "
./Falcon &

echo "Done."
echo "Running Antenna Service 3/5 ..."
./Antenna &

echo "Done."
echo "Running Maze Service 4/5 ..."
serve -s maze -l 50004 2>/dev/null 1>/dev/null &

echo "Done."
echo "Running ControlScreen Service 5/5 ..."
serve -s control_screen -l 50005 2>/dev/null 1>/dev/null &

echo "Done."

#chromium-browser --window-size=800,600 --new-window http://localhost:50005 2>/dev/null 1>/dev/null || \
#    firefox --window-size=800,600 --new-window http://localhost:50005 2>/dev/null 1>/dev/null || \
#    echo "Failed to open ControlScreen in both Chromium and Firefox" &
#chromium-browser --window-size=800,600 --new-window http://localhost:50004 2>/dev/null 1>/dev/null || \
#    firefox --window-size=800,600 --new-window http://localhost:50004 2>/dev/null 1>/dev/null || \
#    echo "Failed to open Maze in both Chromium and Firefox" &

wait