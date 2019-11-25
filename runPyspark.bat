@setlocal

@for /F "delims=" %%I in ("%~dp0.") do @set my_root=%%~fI
@For /F "tokens=*" %%i in ("%my_root%") Do @set my_root=%%~dpnxsi

@echo ...

@set SPARK_HOME=%my_root%\spark_lib\spark-2.3.0-bin-hadoop2.7
@echo SPARK_HOME=%my_root%\spark_lib\spark-2.3.0-bin-hadoop2.7
@echo ...

@set HADOOP_HOME=%my_root%\winutils-master\hadoop-3.0.0
@echo HADOOP_HOME=%my_root%\winutils-master\hadoop-3.0.0
@echo ...

@REM JAVA_HOME: Location where Java is installed (if it's not on your default PATH).
@REM set JAVA_HOME=java_home_path

@REM PYSPARK_PYTHON: Python binary executable to use for PySpark in both driver and workers (default is python2.7 if available, otherwise python). 
@REM set PYSPARK_PYTHON=python_binary_executable

@REM start: comment following lines to run that on cmd.
@REM PYSPARK_DRIVER_PYTHON: Python binary executable to use for PySpark in driver only (default is PYSPARK_PYTHON).
@set PYSPARK_DRIVER_PYTHON=jupyter
@echo PYSPARK_DRIVER_PYTHON=jupyter
@echo ...
@set PYSPARK_DRIVER_PYTHON_OPTS='notebook'
@echo PYSPARK_DRIVER_PYTHON_OPTS='notebook'
@echo ...
@REM end: comment following lines to run that on cmd.

@echo running %SPARK_HOME%\bin\pyspark
@cd %my_root%
@cmd /K %SPARK_HOME%\bin\pyspark
@endlocal