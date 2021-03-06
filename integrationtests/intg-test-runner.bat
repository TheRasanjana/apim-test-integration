@echo off

REM ---------------------------------------------------------------------------
REM        Copyright 2018 WSO2, Inc. http://www.wso2.org
REM
REM  Licensed under the Apache License, Version 2.0 (the "License");
REM  you may not use this file except in compliance with the License.
REM  You may obtain a copy of the License at
REM
REM      http://www.apache.org/licenses/LICENSE-2.0
REM
REM  Unless required by applicable law or agreed to in writing, software
REM  distributed under the License is distributed on an "AS IS" BASIS,
REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM  See the License for the specific language governing permissions and
REM  limitations under the License.

rem prerequisite: Before run this script pip and virtualenv packages have to be installed on the running environment

rem get the working directory
set WD=%1
cd %WD%

rem create the virtual env
virtualenv env

rem activate the environment
call env\Scripts\activate.bat

rem install packages to the virtual environment
env\Scripts\pip.exe install -r requirements.txt

rem updating M2_home directory
set M2_HOME=C:\Users\Administrator\Downloads\apache-maven-3.3.9-bin\apache-maven-3.3.9

rem Deleting unwanted java paths 
cd C:\Program Files (x86)\Common Files\Oracle\Java\javapath
del java.exe
del javaw.exe
del javaws.exe

rem updating PATH for java
set PATH=%PATH%;%JAVA_HOME%/bin;

rem run the run-intg-test.py script
cd %WD%
python run-intg-test.py
