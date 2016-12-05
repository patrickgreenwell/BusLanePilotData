@echo off
echo Download GTFS file from MBTA
curl -O http://www.mbta.com/uploadedfiles/MBTA_GTFS.zip
echo Extracting GTFS file
7z e MBTA_GTFS.zip
echo "Importing files to mongo"
for /r %%i in (*.txt) do (
		@echo on
		mongoimport.exe --type csv --headerline --db mbta --file %%i
		echo %%i
	) 
@echo off
echo Cleaning up
rm MBTA_GTFS.zip -v
rm *.txt -v
