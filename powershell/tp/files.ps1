

# handling files and folders on powershell

# folder stuff

# new folder
New-Item -Path ./new-folder -ItemType Directory 

# copy folder
Copy-Item ./new-folder ./new-folder-copy

# copy with explicit destination
Copy-Item ./new-folder /tmp/new-folder-copy

# copy recursively
Copy-Item -Filter *.ps1 . -Destination /tmp/new-folder-copy -Recurse

# delete folder (Remove-Item also accepts the -Recursive flag)
Remove-Item ./new-folder
Remove-Item ./new-folder-copy

# rename folder
New-Item -Path ./bad-name-folder -ItemType Directory
Rename-Item ./bad-name-folder ./corrected-name
Remove-Item ./corrected-name 


# test file/path existence
Test-Path /tmp
Test-Path /does-not-exist

Test-Path ./hello.ps1


# file stuff

# new file
New-Item -Path ./new-file -ItemType File

# copy file
Copy-Item ./new-file ./new-file-copy

# remove file
Remove-Item ./new-file
Remove-Item ./new-file-copy

# move file
Copy-Item ./hello.ps1 ./hello-copy.ps1
Move-Item ./hello-copy.ps1 /tmp 

# retrieve content from a file
Get-Content ./hello.ps1

# get file length
(Get-Content ./hello.ps1).length 
