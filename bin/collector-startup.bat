@echo off

setlocal
set COLLECTOR_PROCESS_TITLE=Skywalking-Collector
set COLLECTOR_HOME=%~dp0%..
set COLLECTOR_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

set CLASSPATH=%COLLECTOR_HOME%\config;.;
set CLASSPATH=%COLLECTOR_HOME%\libs\*;%CLASSPATH%

if defined JAVA_HOME (
 set _EXECJAVA="%JAVA_HOME:"=%"\bin\java
)

if not defined JAVA_HOME (
 echo "JAVA_HOME not set."
 set _EXECJAVA=java
)
start "%COLLECTOR_PROCESS_TITLE%" %_EXECJAVA% "%COLLECTOR_OPTS%" -cp "%CLASSPATH%" org.skywalking.apm.mock.collector.Main
pause
endlocal