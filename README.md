# msd-initial-task
initial interview task for MSD

## countdown with print
can be run by running `python countdown.py`
takes one optional argument which sets the starting number.
for example: `python countdown.py 9`
if not set, default value of 100 will be used

## web automation
simple web automation using Robot framework and Docker\
To execute the test simply run the following command from the project root directory(you need to have Docker installed)\
`docker run -v $PWD/reports:/opt/robotframework/reports -v $PWD/tests:/opt/robotframework/tests ppodgorsek/robot-framework:latest`\
It will mount the respective folders into the docker container to run the tests from and to provide output for reports.\

## SQL
Implementation is done using SQLite and Repl.it
[Repl.it MSD](https://repl.it/@ondrejPospisil/MSD)

## Notes
*- Since this is a very small project, I did not extract the keywords to separate resources file nor did I follow any extensive POM practice to keep the locators in one place.*\
*- Also the use of docker here is simply to ommit the need for having browsers and their respective selenium drivers installed. The web automation test can be surely run directly from python/docker, but would require user to properly configure the system to include the drivers in PATH and that use was never tested*
