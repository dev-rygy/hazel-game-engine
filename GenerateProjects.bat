:: Script to run the command below in the command prompt; basically
:: we are generating the project files throught the Premake script

call vendor\bin\premake\premake5 vs2022
PAUSE	:: Don't close the window immediately