# create a folder on drive C
cd\
mkdir ShareT
# share the folder
New-SmbShare -Path C:\ShareT -Name ShareT -FullAccess everyone
# check
get-SmbShare
