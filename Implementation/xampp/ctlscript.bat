@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist E:\EHR-project\Implementation\xampp\hypersonic\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\server\hsql-sample-database\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\ingres\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\ingres\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\mysql\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\mysql\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\postgresql\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\postgresql\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\apache\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\apache\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\openoffice\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\openoffice\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\apache-tomcat\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\apache-tomcat\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\resin\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\resin\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\jboss\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\jboss\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\jetty\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\jetty\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\subversion\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\subversion\scripts\ctl.bat START)
rem RUBY_APPLICATION_START
if exist E:\EHR-project\Implementation\xampp\lucene\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\lucene\scripts\ctl.bat START)
if exist E:\EHR-project\Implementation\xampp\third_application\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\third_application\scripts\ctl.bat START)
goto end

:stop
echo "Stopping services ..."
if exist E:\EHR-project\Implementation\xampp\third_application\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\third_application\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\lucene\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\lucene\scripts\ctl.bat STOP)
rem RUBY_APPLICATION_STOP
if exist E:\EHR-project\Implementation\xampp\subversion\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\subversion\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\jetty\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\jetty\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\hypersonic\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\server\hsql-sample-database\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\jboss\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\jboss\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\resin\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\resin\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\apache-tomcat\scripts\ctl.bat (start /MIN /B /WAIT E:\EHR-project\Implementation\xampp\apache-tomcat\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\openoffice\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\openoffice\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\apache\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\apache\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\ingres\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\ingres\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\mysql\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\mysql\scripts\ctl.bat STOP)
if exist E:\EHR-project\Implementation\xampp\postgresql\scripts\ctl.bat (start /MIN /B E:\EHR-project\Implementation\xampp\postgresql\scripts\ctl.bat STOP)

:end

