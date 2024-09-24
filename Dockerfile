# Imagine this file as a recipe for setting up a virtual computer.

# Dockerfiles typically start with a 'base image'. There are loads of these
# and you can find them at hub.docker.com.
# We're going to use a base image for Python veresion 3.11
FROM python:3.11

# This base image contains essentially everything necessary for a 'virtual
# computer'. It has a terminal, certain basic commands, and of course Python.

# We'll need our app's files in the container in order to be able to run them!
# We copy them in from the current directory to the folder `/app` in
# our virtual computer. Reminder `.` means 'the current directory'
COPY . /app

# We set the working directory for commands from this point on
WORKDIR /app

# We set up a virtual environment with `venv` and then use `pip` to install our 
# project's dependencies (from the requirements.txt file).
RUN python -m venv venv \
    && . venv/bin/activate \
    && pip install --upgrade pip \
    && pip install -r requirements.txt

# At this point we've set up our virtual computer, but we've not _yet_ run our
# application. And we're not going to! We're just setting up the container
# so that it's ready to do so when we tell it.

# So we're going to tell Docker here that when we _do_ want to run it, this is
# what it should run:
CMD ["venv/bin/python", "app.py"]