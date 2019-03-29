MSNM-S Dashboard
----------------

Visualization interface to interact with the deployed MSNM-S.

<img src="dashboard.png" alt="MSNM-S dashboard" width="100%">

## Installation

#### Requirements

Despite of MSNM-S runs with python 2.7, the dashboard runs with python 3.5 instead and uses 
Django engine.

#### How to install

Creating a python execution environment is, probably the better way to run the application. So we recommend you to create one
before doing the requeriments installation. Anaconda environment can help you and, if you decide to use it, run the following
commands:

    $ cd dashboard/
    $ conda create -n py35 python=3.5
    $ conda activate py35

Running the previous command will install everything needed.

	(py35) $ pip install -r requirements.txt
	
#### How to run the dashboard application

Dashboard application relies on the use of Django engine, so we have to start the engine and after that open a browser
and type http://localhost:8000 (default configuration).

    (py35) $ python manage.py runserver

