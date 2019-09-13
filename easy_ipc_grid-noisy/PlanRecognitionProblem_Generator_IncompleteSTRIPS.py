#!/usr/bin/python
import sys
import os
import math
from decimal import *
from random import randint
from operator import itemgetter

def main() :
	incompletenessList = [
	#'20', 
	'40', 
	'60', 
	#'80'
	]
	observability = '/100/'
	for incompleteness in incompletenessList:
		for domainNumber in range(0,3):
			for filename in os.listdir(os.getcwd()):
				if ".tar.bz2" in filename:
					os.system('tar -jxvf ' + filename)
					domain = open('domain.pddl', 'w')
					domainIncompleteSTRIPS = open('easy_ipc_grid-' + incompleteness + '-' + str(domainNumber) + '.pddl')

					for line in domainIncompleteSTRIPS:
						domain.write(line)

					domain.close()

					problemContent = ''
					with open('template.pddl') as problem:
					    problemContent = problem.read()
					
					problemContent = problemContent.replace('at ', 'at-key ')

					with open('template.pddl', 'w') as problem:
					    problem.write(problemContent)

					goalsContent = ''
					with open('hyps.dat') as goals:
					    goalsContent = goals.read()
					
					goalsContent = goalsContent.replace('at ', 'at-key ')

					with open('hyps.dat', 'w') as goals:
					    goals.write(goalsContent)

					realGoalContent = ''
					with open('real_hyp.dat') as realGoal:
					    realGoalContent = realGoal.read()
					
					realGoalContent = realGoalContent.replace('at ', 'at-key ')

					with open('real_hyp.dat', 'w') as realGoal:
					    realGoal.write(realGoalContent)

					newFilename = filename.replace('.tar.bz2', '')
					os.system('tar jcvf /Users/ramonfragapereira/Workspace/Planning-PlanRecognition-IncompleteSTRIPS/examples/recognition/easy_ipc_grid-noisy-' 
						+ incompleteness + observability + newFilename + '_incompleteness-' + incompleteness + '-' + str(domainNumber)
						+ '.tar.bz2' + ' domain.pddl template.pddl hyps.dat obs.dat real_hyp.dat')

if __name__ == '__main__' :
	main()