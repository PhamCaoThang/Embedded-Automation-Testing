# Embedded-Automation-Testing

################ Author : WinPi #################

###### Email : phamcaothang1998@gmail.com ########

#############################################

This is project: Embedded Automation Testing

The project is a helpful guideline for anybody who is excited about Automation Testing in Embedded System Projects

To start using this project you need to read the following :

1/ Project structure

    - config folder: This folder contains your hardware configuration such as : ip address, your_name, password,...
    - docs : This folder contains my details note to install jenkins, setup jenkins pipeline,...
    - lib : This library contains common keywords that provide for your test cases
    - source : This folder contains your Robot Framework test cases
    
2/ Robot Framework (and install some example libraries for our test case, such as : sshlibrary)

    - Setup Robot framework:
        + Install robot framework : 
            sudo apt-get install python3 python3-pip
            pip3 install robotframework
        + Check Robot framework version installed :
            robot --version
    - Set up SSHLibrary to develop test cases related to ssh hardware devices.
        + SSHLibrary install : 
            pip install robotframework-sshlibrary
    - Execute Robot framework command check version -> To confirm Robot framework install success without any issues
        robot --version

3/ Execute your first test case

    - Robot framework command structure
        robot --variablefile ${CONFIG_PATH} --outputdir ./output ${TESCASE_NAME}
    - Explain 
         --variablefile : this path of your configuration file
         --outputdir : this path of your report files
         ${TESCASE_NAME} : this is path of your test case
    - Example : 
        robot --variablefile ./config/raspberry_raspbian.json --outputdir ./output ./source/Ssh_RunCommand.robot

4/ What will you do with this project after cloning it?

    - Create your configuration files and push it into config folder
    - Develop common.lib or any other library you want and push it to lib
    - Finally, develop your test case and push it into source. Once more, you can prefer my sample test cases

5/ Jenkins execution, you can prefer the docs folder to read my details about installing jenkins, creating pipeline job. 
    I also have given an example pipeline script that's detailed for everyone. Perhaps, you encounter some issues during 
    using my project, then contact me via phamcaothang1998@gmail.com
