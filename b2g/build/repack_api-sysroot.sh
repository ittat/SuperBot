#!/bin/bash
set -e 
        df -h
        cd ${work}/B2G
        
        if [ "$device_arch" == "aarch64-linux-android" ]; then
          export TARGET_ARCH=arm64
          export TARGET_ARCH_VARIANT=armv8-a
        else
          export TARGET_ARCH=arm
          export TARGET_ARCH_VARIANT=armv7-a-neon
        fi
        
      
        . "${work}/B2G/.config"
        #export GONK_PRODUCT_NAME=${TARGET_NAME}
        export GONK_PRODUCT_NAME="generic_arm64"
        echo GONK_PRODUCT_NAME -- ${GONK_PRODUCT_NAME}
        
        if [ "$device_name" == "onyx" ]; then
          export TARGET_CPU_VARIANT=krait
        else
          export TARGET_CPU_VARIANT=generic
        fi
        
        ./api_sysroot.sh
        sudo rm -rf ./api-sysroot
        ls -al
        mv api-sysroot.tar.zst ${work}
        df -h