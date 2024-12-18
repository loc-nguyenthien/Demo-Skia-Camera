prompt_android="Please select mode for android: "
OPTIONS_ANDROID=(
    "developmentDebug"
    "developmentRelease"
    "stagingDebug"
    "stagingRelease"
    "productionDebug"
    "productionRelease"
    "quit"
)

if [ "$1" == "android" ]
then
    PS3="$prompt_android"
    select opt in "${OPTIONS_ANDROID[@]}"; do
        if [ "$opt" == "quit" ]
        then
            break
        fi
        if [ "$opt" == "" ]
        then
            echo "Invalid"
        else
             echo "Mode: $opt"
             npx react-native run-android --mode $opt
            break
        fi
    done
fi

prompt_ios="Please select variant for ios: "
OPTIONS_IOS=(
    "FaceDetectCameraDev"
    "FaceDetectCameraStg"
    "FaceDetectCamera"
    "quit"
)

if [ "$1" == "ios" ]
then
    PS3="$prompt_ios"
    select opt in "${OPTIONS_IOS[@]}"; do
        if [ "$opt" == "quit" ]
        then
            break
        fi
        if [ "$opt" == "" ]
        then
            echo "Invalid"
        else
            echo "Scheme: $opt"
            npx react-native run-ios --scheme "$opt"
            break
        fi
    done
fi
