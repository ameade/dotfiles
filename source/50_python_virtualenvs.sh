alias pip="pip-python"
export WORKON_HOME=$HOME/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
source /bin/virtualenvwrapper.sh

#If virtualenv is not created
#mkvirtualenv --no-site-packages -p /usr/bin/python2.7 --distribute ~/virtualenvs/python27

export PYTHONPATH=
workon python27
