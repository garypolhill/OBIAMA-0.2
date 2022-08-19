@echo off

set cwd=%CD%
set jarloc=..\..
set libloc=%jarloc%\lib
set cp=%jarloc%\obiama-0.2.jar;%jarloc%\utils.jar

rem libraries

rem RePast
set cp=%cp%;%libloc%\repast.jar

rem OWLAPI
set cp=%cp%;%libloc%\owlapi-bin.jar

rem Pellet
set cp=%cp%;%libloc%\pellet-owlapi.jar;%libloc%\pellet-core.jar;%libloc%\pellet-el.jar;%libloc%\pellet-datatypes.jar;%libloc%\pellet-rules.jar;%libloc%\aterm-java-1.6.jar;%libloc%\xsdlib\relaxngDatatype.jar;%libloc%\xsdlib\xsdlib.jar;%libloc%\jgrapht\jgrapht-jdk1.5.jar

rem clean-up

del /f /q output\*.*

rem set up the command

set provenance=http://www.macaulay.ac.uk/obiama/ontologies/SimpEG5-provenance.owl
set structure=http://www.macaulay.ac.uk/obiama/ontologies/SimpleExample4.owl
set schedule=http://www.macaulay.ac.uk/obiama/ontologies/SimpleExample4-Schedule.owl
set schedinst=%schedule%#schedule
set initinst=%schedule%#initialisation

set cmd=java -classpath %cp% uk.ac.macaulay.obiama.model.RepastModel --ontology %structure% --initial-schedule %initinst% --schedule %schedule% --main-schedule %schedinst% --ontology-search-path %cwd%;%cwd%\..\..\ontologies --log SimpleExample2.log --save-last %cwd%\output --use-reasoner --save-inferred --provenance OPM --history-provenance %provenance%

echo %cmd%

%cmd%
