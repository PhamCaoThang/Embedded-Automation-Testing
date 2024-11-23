# Embedded-Automation-Testing
This is project : Embedded Automation Testing

#############################################
###########    Author : WinPi    ############
#############################################

1/ Robot Framework
    - Setup Robot framework:
        + Install robot framework : 
            sudo apt-get install python3 python3-pip
            pip3 install robotframework
        + Check Robot framework version installed :
            robot --version
    - Setup SSHLibrary to develop test case releate to ssh hardware devices.
        + SSHLibrary install : 
            pip install robotframework-sshlibrary
2/ Execute demo test case Helloworld.robot -> To confirm Robot framework install success without any issues
    robot --outputdir ${your_output_path} ./source/Ssh_RunCommand.robot

3/ Execute demo test case Ssh_RunCommand.robot -> To confirm we can ssh to Hardware devices success without any issues
