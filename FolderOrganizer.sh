#!/bin/bash
declare FileExtention=""
if [ -s "$1" ];
then 
   for Filename in `ls -p $1 | grep -v /`;do

        if [[ "${Filename}" == *"."* ]]; then
            FileExtention=${Filename##*.}

            if [ "$FileExtention" == "txt" ] || [ "$FileExtention" == "zip" ] || [ $"$FileExtention" == "pdf" ] || [ "$FileExtention" == "jpg" ]; then
                if ! [ -d "$1/$FileExtention" ]; then
                    `mkdir "$1/$FileExtention" &`
                fi
                
                `sudo mv $1/$Filename $1/$FileExtention`
                
            fi
            
        else
            if ! [ -d "$1/Misc" ]; then
                `mkdir "$1/Misc" &`
            fi
            `sudo mv $1/$Filename $1/Misc`
        fi
        
        
   done
else
   echo " file does not exist, or is empty "
   zenity --error --text="file does not exist, or is empty "
fi