#!/bin/bash

cwd=`pwd`
jarloc=../..
libloc=$jarloc/lib
cp=$jarloc/obiama-0.2.jar:$jarloc/utils.jar

# libraries

cp+=:$libloc/repast.jar		# Repast
cp+=:$libloc/owlapi-bin.jar	# OWLAPI
cp+=:$libloc/pellet-owlapi.jar:$libloc/pellet-core.jar:$libloc/pellet-el.jar:$libloc/pellet-datatypes.jar:$libloc/pellet-rules.jar:$libloc/aterm-java-1.6.jar:$libloc/xsdlib/relaxngDatatype.jar:$libloc/xsdlib/xsdlib.jar:$libloc/jgrapht/jgrapht-jdk1.5.jar
#                                 Pellet

rm -rf output/*

# set up the command

structure=http://www.macaulay.ac.uk/obiama/ontologies/SimpleExample.owl
initstate=http://www.macaulay.ac.uk/obiama/ontologies/SimpleExample-Init.owl
schedule=http://www.macaulay.ac.uk/obiama/ontologies/SimpleExample-Schedule.owl
schedinst="${schedule}#schedule"

cmd="java -classpath $cp uk.ac.macaulay.obiama.model.RepastModel --ontology $structure --state-ontology $initstate --schedule $schedule --main-schedule $schedinst --ontology-search-path $cwd:$cwd/../../ontologies --log SimpleExample.log --save-last $cwd/output --save-inferred --use-reasoner"

echo $cmd

$cmd
